import 'dart:async';

import 'package:blossm_command/index.dart';
import 'package:secure_storage/index.dart';

class SMTokenStore implements TokenStore {
  final _key = "token";

  @override
  void Function(String) get saveToken => (String token) {
        save(key: _key, value: token);
      };

  @override
  FutureOr<String> Function() get readToken => () => valueForKey(_key);
}
