import 'package:string_from_enum_string/index.dart';

enum _EmailCategoryTypeOption {
  gettingStartedReminder,
  tenantJoined,
  invitationSent,
  landlordInvoiceCreated,
  tenantInvoiceCreated,
  invoiceReminder,
  landlordTodo,
  roommateTodo
}

class EmailCategoryType {
  final _EmailCategoryTypeOption _value;
  const EmailCategoryType._internal(this._value);
  factory EmailCategoryType.fromString(String string) {
    final option = _EmailCategoryTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return EmailCategoryType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
