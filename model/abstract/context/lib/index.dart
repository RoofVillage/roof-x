import 'package:date/index.dart';
import 'package:meta/meta.dart';

import 'package:model_object/index.dart';
import 'package:name_defining_object/index.dart';
import 'package:key/index.dart' as _key;

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

  static Context fromMap(Map<String, Object> map) {
    final modelObject = ModelObject.fromMap(map);
    final counts = map[_key.counts] as Map;
    return Context(
        guid: modelObject.guid,
        dateCreated: modelObject.dateCreated,
        creatorGuid: modelObject.creatorGuid,
        unreadCommentableObjectCount: counts[_key.unreadCommentableObject] ?? 0,
        pinnedCommentableObjectCount:
            counts[_key.pinnedCommentableObject] ?? 0);
  }

  Map<String, Object> toMap() {
    return {
      _key.counts: {
        _key.unreadCommentableObject: unreadCommentableObjectCount,
        _key.pinnedCommentableObject: pinnedCommentableObjectCount
      }
    };
  }
}
