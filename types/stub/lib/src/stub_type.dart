import 'package:string_from_enum_string/index.dart';

enum _StubTypeOption { user }

class StubType {
  final _StubTypeOption _value;
  const StubType._internal(this._value);
  factory StubType.fromString(String string) {
    final option = _StubTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return StubType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
