import 'package:string_from_enum_string/index.dart';

enum _ExpenseTypeOption {
  normal,
  reminderPrizeCompletion,
  shoppingItemPrizeCompletion
}

class ExpenseType {
  final _ExpenseTypeOption _value;
  const ExpenseType._internal(this._value);
  factory ExpenseType.fromString(String string) {
    final option = _ExpenseTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return ExpenseType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
