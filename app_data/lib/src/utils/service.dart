import 'package:string_from_enum_string/index.dart';

enum _ServiceOption { activity, signUp }

class Service {
  final _ServiceOption _value;

  static const activity = Service._internal(_ServiceOption.activity);
  static const signUp = Service._internal(_ServiceOption.signUp);

  final _version = '0';
  final _domain = 'https://api.roof.io';

  const Service._internal(this._value);
  factory Service.fromString(String string) {
    final option = _ServiceOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return Service._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());

  String get service {
    switch (_value) {
      case _ServiceOption.activity:
        return "activity";
      case _ServiceOption.signUp:
        return "user.register";
    }
    return null;
  }

  String get address {
    return _domain + "/v" + _version + "/" + service;
  }

  bool get doesNeedSession {
    switch (_value) {
      case _ServiceOption.activity:
      case _ServiceOption.signUp:
        return false;
      default:
        return true;
    }
  }
}
