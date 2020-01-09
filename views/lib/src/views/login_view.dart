import 'package:views/src/view_store.dart';

class LoginViewStore with ViewStore<LoginView> {
  @override
  String get address => "login";

  @override
  LoginView Function(Map<String, Object>) get viewFromMap =>
      (Map<String, Object> map) {
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
