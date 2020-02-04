abstract class TokenStore {
  void Function(String) get saveToken;
  Future<String> Function() get readToken;
}
