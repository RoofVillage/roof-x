import 'package:views/src/view_model.dart';

class LoginViewModel extends ViewModel {
  LoginViewModel({
    this.day,
    this.temperature,
  });

  final String day;
  final int temperature;

  @override
  ViewModel Function(Map<String, Object>) get fromMap =>
      (Map<String, Object> map) {
        return LoginViewModel(
          day: map["day"],
          temperature: map["temperature"],
        );
      };
}
