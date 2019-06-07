import 'package:string_from_enum_string/index.dart';

enum RequestStatusOption { open, closed, emergency }

class RequestStatus {
  static RequestStatusOption fromRequest(String status) {
    for (final value in RequestStatusOption.values) {
      if (stringFromEnumString(value.toString()) == status) return value;
    }

    throw ("Error converting RequestStatus: $status");
  }
}
