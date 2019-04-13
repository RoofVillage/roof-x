import 'dart:async';

import 'package:meta/meta.dart';
import 'package:cache/index.dart' as _cache;
import 'package:secure_storage/index.dart' as _secure_storage;
import 'package:date/index.dart';
import 'package:user/index.dart';
import 'package:context/index.dart';
import 'package:model_object_cache/index.dart';

import 'utils/index.dart';

const _sessionTokenKey = 'sessionToken';
const _verificationTokenKey = 'verificationToken';
const _refreshTokenKey = 'refreshToken';
const _contextKey = 'context';
const _syncIdKey = 'syncId';

const _jwtExpiredKey = 'expired';
const _jwtOwnerKey = 'owner';

const _expiredSecondsBuffer = 20;

Future<String> get token async {
  return await _sessionToken ?? _verificationToken;
}

Future<String> get _sessionToken async {
  return await _tokenForKey(_sessionTokenKey);
}

Future<String> get _verificationToken async {
  return await _tokenForKey(_verificationTokenKey);
}

Future<String> get refreshToken async {
  return await _tokenForKey(_refreshTokenKey);
}

Future<String> get ownerGuid async {
  final _token = await token;

  if (token == null) throw Exception("No session token");

  final jwt = Jwt().parse(_token);

  final ownerGuid = jwt[_jwtOwnerKey];

  return ownerGuid;
}

Future<bool> get isSessionExpired async {
  final _token = await token;

  if (token == null) throw Exception("No session token");

  final jwt = Jwt().parse(_token);

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

Future<String> get currentContextGuid async {
  return await _cache.stringForKey(_contextKey);
}

Future<String> get currentSyncId async {
  return await _cache.stringForKey(_syncIdKey);
}

Future<User> get owner async {
  final _ownerGuid = await ownerGuid;
  if (_ownerGuid == null) return null;

  return ModelObjectCache()
      .read<User>(guid: _ownerGuid, converter: User.fromMap);
}

Future<Context> get currentContext async {
  final _currentContextGuid = await currentContextGuid;
  if (_currentContextGuid == null) return null;

  return ModelObjectCache()
      .read<Context>(guid: _currentContextGuid, converter: Context.fromMap);
}

Future setCurrentContext(String contextGuid) async {
  if (await currentContextGuid == contextGuid) return;

  List<String> except = [];
  final _ownerGuid = await ownerGuid;

  if (ownerGuid != null) except.add(_ownerGuid);
  if (contextGuid != null) except.add(contextGuid);

  ModelObjectCache().empty(except: except);

  if (contextGuid == null) {
    _cache.removeValueForKey(_contextKey);
  } else {
    _cache.saveString(string: contextGuid, key: _contextKey);
  }
}

void start({@required String sessionToken, @required String refreshToken}) {
  return;
}

void standby({@required String verificationToken}) {
  return;
}

void end() async {
  _terminateSession();
  Future.wait([setCurrentContext(null), _removeTokenForKey(_sessionTokenKey)]);
}

Future _terminateSession() async {
  Future.wait([
    _removeSessionToken(),
    _removeRefreshToken(),
    _removeVerificationToken()
  ]);
}

Future _removeSessionToken() async {
  await _removeTokenForKey(_sessionTokenKey);
}

Future _removeVerificationToken() async {
  await _removeTokenForKey(_verificationTokenKey);
}

Future _removeRefreshToken() async {
  await _removeTokenForKey(_refreshTokenKey);
}

Future<String> _tokenForKey(String key) async {
  final secureStorageKey = await _cache.stringForKey(key);

  if (secureStorageKey == null) return null;

  return await _secure_storage.valueForKey(secureStorageKey);
}

Future _removeTokenForKey(String key) async {
  final secureStorageKey = await _cache.stringForKey(key);

  if (secureStorageKey == null) return null;
  await Future.wait(
      [_secure_storage.removeValueForKey(key), _cache.removeValueForKey(key)]);
}
