import 'dart:async';

import 'package:blossm_command/index.dart';
import 'package:secure_storage/index.dart';

class SMTokenStore implements TokenStore {
  @override
  String get tokenKey => "token";

  @override
  void Function(String) get saveToken => (String token) {
        save(key: tokenKey, value: token);
      };

  @override
  FutureOr<String> Function() get readToken => () => valueForKey(tokenKey);
}
