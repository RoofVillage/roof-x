import 'package:views/src/utils/index.dart';

class AuthDomainConfig implements ViewStoreDomainConfig {
  String get baseUrl => coreStagingBaseUrl;
  String get domain => "auth";
}
