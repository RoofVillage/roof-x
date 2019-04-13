import 'package:string_from_enum_string/index.dart';

enum _TaskTypeOption { reminder, invoice, shoppingItem, serviceRequest }

class TaskType {
  final _TaskTypeOption _value;
  const TaskType._internal(this._value);
  factory TaskType.fromString(String string) {
    final option = _TaskTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return TaskType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
