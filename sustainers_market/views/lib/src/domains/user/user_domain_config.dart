import 'package:views/src/utils/index.dart';

class UserDomainConfig implements ViewStoreDomainConfig {
  String get baseUrl => coreStagingBaseUrl;
  String get domain => "user";
}
