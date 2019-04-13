import 'package:string_from_enum_string/index.dart';

enum _AssignmentTypeOption { takeTurnsFair, everyone }

class AssignmentType {
  final _AssignmentTypeOption _value;
  const AssignmentType._internal(this._value);
  factory AssignmentType.fromString(String string) {
    final option = _AssignmentTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return AssignmentType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
