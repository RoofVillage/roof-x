import 'package:blossm_view_store/index.dart';
import 'package:views/src/domains/auth/auth_domain_config.dart';

class LoginViewStore with BlossmViewStore<LoginView, Map>, AuthDomainConfig {
  @override
  String get route => "login";

  @override
  LoginView Function(Map) get viewFromHttpResponse => (Map map) {
        return LoginView(
          day: map["day"],
          temperature: map["temperature"],
        );
      };
}

class LoginView {
  final String day;
  final int temperature;

  LoginView({
    this.day,
    this.temperature,
  });
}
