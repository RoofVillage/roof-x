import 'dart:async';

abstract class TokenStore {
  void Function(String) get saveToken;
  FutureOr<String> Function() get readToken;
}
