import 'package:views/src/view_store.dart';

class LoginViewStore with ViewStore<LoginView, Map> {
  @override
  String get route => "login";

  @override
  String get domain => "auth";

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
