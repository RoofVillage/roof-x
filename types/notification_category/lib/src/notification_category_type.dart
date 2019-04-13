import 'package:string_from_enum_string/index.dart';

enum _NotificationCategoryTypeOption {
  reminderEvent,
  reminderEventSecondary,
  reminder,
  reminderSecondary,
  reminderThirdPerson,
  threadSecondary,
  shoppingItemEvent,
  shoppingItemEventSecondary,
  serviceRequestEvent,
  serviceRequestEventSecondary,
  invoiceEvent,
  invoiceEventSecondary,
  expense,
  transfer,
  domain,
  tenantJoined,
  invoice,
  comment,
  landlordTodo,
  roommateTodo
}

class NotificationCategoryType {
  final _NotificationCategoryTypeOption _value;
  const NotificationCategoryType._internal(this._value);
  factory NotificationCategoryType.fromString(String string) {
    final option = _NotificationCategoryTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return NotificationCategoryType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
