abstract class TokenStore {
  void Function(String) get saveSessionToken;
  void Function(String) get saveChallengeToken;

  Future<String> Function() get readSessionToken;
  Future<String> Function() get readChallengeToken;

  void Function() get deleteSessionToken;
  void Function() get deleteChallengeToken;
}
