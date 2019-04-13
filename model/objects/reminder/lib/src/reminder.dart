import 'package:task/index.dart';

class Reminder extends Task {
  factory Reminder.fromMap(Map<String, Object> map) {
    return Task.fromMap(map);
  }
}
