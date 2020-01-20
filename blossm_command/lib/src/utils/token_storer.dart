import 'dart:async';

abstract class TokenStore {
  String get tokenKey;
  void Function(String) get saveToken;
  FutureOr<String> Function() get readToken;
}
