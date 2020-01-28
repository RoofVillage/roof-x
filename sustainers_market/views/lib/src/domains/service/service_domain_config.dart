import 'package:views/src/utils/index.dart';

class ServiceDomainConfig implements ViewStoreDomainConfig {
  String get baseUrl => coreStagingBaseUrl;
  String get domain => "auth";
}
