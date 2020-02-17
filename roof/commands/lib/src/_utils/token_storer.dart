import 'package:blossm_command/index.dart';
import 'package:secure_storage/index.dart';

class RoofTokenStore implements TokenStore {
  static const _sessionTokenKey = "sessionToken";
  static const _challengeTokenKey = "challengeToken";

  @override
  void Function() get deleteChallengeToken =>
      () => removeValueForKey(_challengeTokenKey);

  @override
  void Function() get deleteSessionToken =>
      () => removeValueForKey(_sessionTokenKey);

  @override
  Future<String> Function() get readChallengeToken =>
      () => valueForKey(_challengeTokenKey);

  @override
  Future<String> Function() get readSessionToken =>
      () => valueForKey(_sessionTokenKey);

  @override
  void Function(String) get saveChallengeToken => (String token) => save(
        key: _challengeTokenKey,
        value: token,
      );

  @override
  void Function(String) get saveSessionToken => (String token) => save(
        key: _sessionTokenKey,
        value: token,
      );
}
