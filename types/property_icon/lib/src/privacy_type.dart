import 'package:string_from_enum_string/index.dart';

enum _PropertyIconTypeOption {
  house1,
  house2,
  house3,
  house4,
  house5,
  house6,
  house7,
  house8,
  house9,
  apartment1,
  apartment2,
  apartment3,
  apartment4,
  apartment5,
  apartment6,
  igloo,
  tent,
  camper,
  treehouse,
}

class PropertyIconType {
  final _PropertyIconTypeOption _value;
  const PropertyIconType._internal(this._value);
  factory PropertyIconType.fromString(String string) {
    final option = _PropertyIconTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return PropertyIconType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
