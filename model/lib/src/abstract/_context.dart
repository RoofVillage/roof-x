import '../utils/index.dart';

import '_object.dart';

class Context extends ModelObject {
  final int unreadCommentableObjectCount;
  final int pinnedCommentableObjectCount;

  const Context(
      {this.unreadCommentableObjectCount, this.pinnedCommentableObjectCount});

  factory Context.fromMap(Map<String, Object> map) {
    final counts = map[Key.counts] as Map;
    return Context(
        unreadCommentableObjectCount: counts[Key.unreadCommentableObject],
        pinnedCommentableObjectCount: counts[Key.pinnedCommentableObject]);
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
