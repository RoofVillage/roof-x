import 'package:string_from_enum_string/index.dart';

enum _EventTypeOption {
  userJoined,
  userLeft,
  userNickname,
  domainName,
  expenseChanged,
  prizeChanged,
  expenseDeleted,
  reminderPrizeCompletionDeleted,
  shoppingItemPrizeCompletionDeleted,
  reminderCreated,
  reminderChanged,
  reminderNameChanged,
  reminderNoteChanged,
  reminderPrizeChanged,
  reminderScheduleChanged,
  reminderDeadlineChanged,
  reminderParticipantsChanged,
  reminderAssignedUsersChanged,
  reminderDeleted,
  shoppingItemCreated,
  shoppingItemChanged,
  shoppingItemNameChanged,
  shoppingItemNoteChanged,
  shoppingItemPrizeChanged,
  shoppingItemParticipantsChanged,
  shoppingItemOutOfStock,
  shoppingItemDeleted,
  settlementChanged,
  settlementDeleted,
  serviceRequestCreated,
  serviceRequestNameChanged,
  serviceRequestNoteChanged,
  serviceRequestPermissionChanged,
  serviceRequestPermissionNoteChanged,
  serviceRequestDeleted,
  serviceRequestChanged,
  transferFailed,
  transferCancelled,
  propertyCreated,
  propertyDeleted,
  leaseCreated,
  leaseDeleted,
  bankAdded,
  invoiceDeleted,
  invoiceNameChanged,
  invoiceNoteChanged,
  invoiceDeadlineChanged,
  invoiceAmountChanged,
  invoiceCreated,
  invoiceContractualCreated,
  invoiceOverdue,
  creditCardAdded,
  commentableObjectSubscribed,
  commentableObjectUnsubscribed,
  threadCreated,
  threadNameChanged,
  threadNoteChanged,
  threadDeleted,
  taskReassigned
}

class EventType {
  final _EventTypeOption _value;
  bool get shouldShowInFeeds {
    switch (_value) {
      case _EventTypeOption.reminderChanged:
      case _EventTypeOption.shoppingItemChanged:
      case _EventTypeOption.reminderParticipantsChanged:
      case _EventTypeOption.reminderAssignedUsersChanged:
      case _EventTypeOption.reminderScheduleChanged:
      case _EventTypeOption.reminderNoteChanged:
      case _EventTypeOption.reminderNameChanged:
      case _EventTypeOption.reminderDeadlineChanged:
      case _EventTypeOption.reminderPrizeChanged:
      case _EventTypeOption.serviceRequestChanged:
      case _EventTypeOption.serviceRequestNameChanged:
      case _EventTypeOption.serviceRequestNoteChanged:
      case _EventTypeOption.serviceRequestPermissionChanged:
      case _EventTypeOption.serviceRequestPermissionNoteChanged:
      case _EventTypeOption.shoppingItemNoteChanged:
      case _EventTypeOption.shoppingItemNameChanged:
      case _EventTypeOption.shoppingItemPrizeChanged:
      case _EventTypeOption.shoppingItemParticipantsChanged:
      case _EventTypeOption.invoiceAmountChanged:
      case _EventTypeOption.invoiceNoteChanged:
      case _EventTypeOption.invoiceDeadlineChanged:
      case _EventTypeOption.invoiceContractualCreated:
      case _EventTypeOption.commentableObjectSubscribed:
      case _EventTypeOption.invoiceOverdue:
      case _EventTypeOption.threadNameChanged:
      case _EventTypeOption.threadNoteChanged:
      case _EventTypeOption.taskReassigned:
        return false;
      default:
        return true;
    }
  }

  const EventType._internal(this._value);
  factory EventType.fromString(String string) {
    final option = _EventTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return EventType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
