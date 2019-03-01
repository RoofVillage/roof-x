import 'package:date/index.dart';
import 'package:meta/meta.dart';
import '../utils/index.dart';
import '../mixins/index.dart';

import 'model_object.dart';

class Context extends ModelObject with NameDefiningObject {
  final int unreadCommentableObjectCount;
  final int pinnedCommentableObjectCount;

  Set<String> get userGuids => Set();
  Set<String> get formerUserGuids => Set();

  Context({
    String guid,
    Date dateCreated,
    String creatorGuid,
    @required this.unreadCommentableObjectCount,
    @required this.pinnedCommentableObjectCount,
  })  : assert(unreadCommentableObjectCount != null),
        assert(pinnedCommentableObjectCount != null),
        super(guid: guid, dateCreated: dateCreated, creatorGuid: creatorGuid);

  factory Context.fromMap(Map<String, Object> map) {
    final modelObject = ModelObject.fromMap(map);
    final counts = map[Key.counts] as Map;
    return Context(
        guid: modelObject.guid,
        dateCreated: modelObject.dateCreated,
        creatorGuid: modelObject.creatorGuid,
        unreadCommentableObjectCount: counts[Key.unreadCommentableObject] ?? 0,
        pinnedCommentableObjectCount: counts[Key.pinnedCommentableObject] ?? 0);
  }

  Map<String, Object> toMap() {
    return {
      Key.counts: {
        Key.unreadCommentableObject: unreadCommentableObjectCount,
        Key.pinnedCommentableObject: pinnedCommentableObjectCount
      }
    };
  }
}
