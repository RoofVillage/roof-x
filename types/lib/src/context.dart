import 'package:string_from_enum_string/index.dart';

enum _ContextTypeOption { roof, org, lease }

class ContextType {
  final _ContextTypeOption _value;
  const ContextType._internal(this._value);
  factory ContextType.fromString(String string) {
    final option = _ContextTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return ContextType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
