import 'package:meta/meta.dart';
import 'package:cache/index.dart';
import 'package:secure_storage/index.dart';
import 'package:date/index.dart';
import 'package:model/index.dart';

import 'utils/index.dart';

class Session {
  static const _sessionTokenKey = 'sessionToken';
  static const _verificationTokenKey = 'verificationToken';
  static const _refreshTokenKey = 'refreshToken';
  static const _contextKey = 'context';
  static const _syncIdKey = 'syncId';

  static const _jwtExpiredKey = 'expired';
  static const _jwtOwnerKey = 'owner';

  static const _expiredSecondsBuffer = 20;

  static Future<String> get token async {
    return await _sessionToken ?? _verificationToken;
  }

  static Future<String> get _sessionToken async {
    return await _tokenForKey(_sessionTokenKey);
  }

  static Future<String> get _verificationToken async {
    return await _tokenForKey(_verificationTokenKey);
  }

  static Future<String> get refreshToken async {
    return await _tokenForKey(_refreshTokenKey);
  }

  static Future<String> get ownerGuid async {
    final token = await Session.token;

    if (token == null) throw Exception("No session token");

    final jwt = Jwt().parse(token);

    final ownerGuid = jwt[_jwtOwnerKey];

    return ownerGuid;
  }

  static Future<bool> get isSessionExpired async {
    final token = await Session.token;

    if (token == null) throw Exception("No session token");

    final jwt = Jwt().parse(token);

    final expirationTimestamp = jwt[_jwtExpiredKey];

    if (expirationTimestamp == null) {
      throw Exception("Session token expiration not found");
    }

    final expirationTimestampToCompare =
        expirationTimestamp - _expiredSecondsBuffer;

    final expirationDateToCompare =
        Date.fromSecondsSinceEpoch(expirationTimestampToCompare);

    return DateTime.now().isAfter(expirationDateToCompare);
  }

  static Future<String> get currentContextGuid async {
    return await Cache().stringForKey(_contextKey);
  }

  static Future<String> get currentSyncId async {
    return await Cache().stringForKey(_syncIdKey);
  }

  static Future<User> get owner async {
    final ownerGuid = await Session.ownerGuid;
    if (ownerGuid == null) return null;

    return ModelObjectCache()
        .read<User>(guid: ownerGuid, converter: User.fromMap);
  }

  static Future<Context> get currentContext async {
    final currentContextGuid = await Session.currentContextGuid;
    if (currentContextGuid == null) return null;

    return ModelObjectCache()
        .read<Context>(guid: currentContextGuid, converter: Context.fromMap);
  }

  static Future setCurrentContext(String contextGuid) async {
    if (await currentContextGuid == contextGuid) return;

    List<String> except = [];
    final ownerGuid = await Session.ownerGuid;

    if (ownerGuid != null) except.add(ownerGuid);
    if (contextGuid != null) except.add(contextGuid);

    ModelObjectCache().empty(except: except);

    if (contextGuid == null) {
      Cache().removeValueForKey(_contextKey);
    } else {
      Cache().saveString(string: contextGuid, key: _contextKey);
    }
  }

  static void start(
      {@required String sessionToken, @required String refreshToken}) {
    return;
  }

  static void standby({@required String verificationToken}) {
    return;
  }

  static void end() async {
    _terminateSession();
    Future.wait(
        [setCurrentContext(null), _removeTokenForKey(_sessionTokenKey)]);
  }

  static Future _terminateSession() async {
    Future.wait([
      _removeSessionToken(),
      _removeRefreshToken(),
      _removeVerificationToken()
    ]);
  }

  static Future _removeSessionToken() async {
    await _removeTokenForKey(_sessionTokenKey);
  }

  static Future _removeVerificationToken() async {
    await _removeTokenForKey(_verificationTokenKey);
  }

  static Future _removeRefreshToken() async {
    await _removeTokenForKey(_refreshTokenKey);
  }

  static Future<String> _tokenForKey(String key) async {
    final secureStorageKey = await Cache().stringForKey(key);

    if (secureStorageKey == null) return null;

    return await SecureStorage().valueForKey(secureStorageKey);
  }

  static Future _removeTokenForKey(String key) async {
    final secureStorageKey = await Cache().stringForKey(key);

    if (secureStorageKey == null) return null;
    await Future.wait([
      SecureStorage().removeValueForKey(key),
      Cache().removeValueForKey(key)
    ]);
  }
}
