import 'package:string_from_enum_string/index.dart';

enum _CompletionTypeOption { plain, expense, transfer, settlement }

class CompletionCategoryType {
  final _CompletionTypeOption _value;
  const CompletionCategoryType._internal(this._value);
  factory CompletionCategoryType.fromString(String string) {
    final option = _CompletionTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return CompletionCategoryType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
