import 'package:string_from_enum_string/index.dart';

enum _ContractTypeOption { lease }

class ContractCategoryType {
  final _ContractTypeOption _value;
  const ContractCategoryType._internal(this._value);
  factory ContractCategoryType.fromString(String string) {
    final option = _ContractTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return ContractCategoryType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
