import 'package:types/index.dart';
import 'package:date/index.dart';
import '../utils/index.dart';

class TaskReference extends Mappable {
  final String guid;
  final String name;
  final TaskType type;
  final Date deadline;

  TaskReference({this.guid, this.name, this.type, this.deadline});

  factory TaskReference.fromMap(Map<String, Object> map) {
    return TaskReference(
        guid: map[Key.guid],
        name: map[Key.name],
        type: TaskType.fromString(map[Key.kind]),
        deadline: Date.fromSecondsSinceEpoch(map[Key.deadline]));
  }

  @override
  Map<String, Object> toMap() {
    return {
      Key.guid: guid,
      Key.name: name,
      Key.kind: type.toString(),
      Key.deadline: deadline.secondsSinceEpoch
    };
  }
}
