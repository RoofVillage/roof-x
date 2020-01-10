import 'package:views/src/utils/index.dart';

class ChallengeDomainConfig implements ViewStoreDomainConfig {
  String get baseUrl => coreStagingBaseUrl;
  String get domain => "auth";
}
