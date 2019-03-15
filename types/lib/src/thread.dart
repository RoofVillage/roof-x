import 'package:string_from_enum_string/index.dart';

enum _ThreadTypeOption { plain, expense }

class ThreadType {
  final _ThreadTypeOption _value;
  const ThreadType._internal(this._value);
  factory ThreadType.fromString(String string) {
    final option = _ThreadTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return ThreadType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
