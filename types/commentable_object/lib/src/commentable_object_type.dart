import 'package:string_from_enum_string/index.dart';

enum _CommentableObjectTypeOption {
  reminder,
  shoppingItem,
  invoice,
  serviceRequest,
  thread
}

class CommentableObjectType {
  final _CommentableObjectTypeOption _value;
  const CommentableObjectType._internal(this._value);
  factory CommentableObjectType.fromString(String string) {
    final option = _CommentableObjectTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return CommentableObjectType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
