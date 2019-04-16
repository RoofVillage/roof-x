import 'package:string_from_enum_string/index.dart';

enum _InvitationTypeOption { roommate, tenant, teammate }

class InvitationType {
  final _InvitationTypeOption _value;
  const InvitationType._internal(this._value);
  factory InvitationType.fromString(String string) {
    final option = _InvitationTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return InvitationType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
