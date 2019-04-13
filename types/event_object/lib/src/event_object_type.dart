import 'package:string_from_enum_string/index.dart';

enum _EventObjectTypeOption {
  roof,
  org,
  lease,
  reminder,
  shoppingItem,
  expense,
  settlement,
  transfer,
  invoice,
  bank,
  property,
  subscriber,
  serviceRequest,
  commentableObject,
  thread,
  task
}

class EventObjectType {
  final _EventObjectTypeOption _value;
  const EventObjectType._internal(this._value);
  factory EventObjectType.fromString(String string) {
    final option = _EventObjectTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return EventObjectType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());

  bool get isCommentableObject {
    switch (_value) {
      case _EventObjectTypeOption.invoice:
      case _EventObjectTypeOption.reminder:
      case _EventObjectTypeOption.shoppingItem:
      case _EventObjectTypeOption.task:
      case _EventObjectTypeOption.serviceRequest:
      case _EventObjectTypeOption.commentableObject:
      case _EventObjectTypeOption.thread:
        return true;
      default:
        return false;
    }
  }
}
