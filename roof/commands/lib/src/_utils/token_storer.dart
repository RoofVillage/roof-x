import 'package:blossm_command/index.dart';
import 'package:secure_storage/index.dart';

class RoofTokenStore implements TokenStore {
  static const _tokenKey = "token";

  @override
  void Function(String) get saveToken => (String token) {
        save(
          key: _tokenKey,
          value: token,
        );
      };

  @override
  Future<String> Function() get readToken => () => valueForKey(_tokenKey);
}
