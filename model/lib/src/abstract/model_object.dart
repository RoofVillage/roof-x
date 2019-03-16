import 'package:meta/meta.dart';
import 'package:date/index.dart';

import '../utils/index.dart';

class ModelObject extends Object with Mappable {
  final String guid;
  final String creatorGuid;
  final Date dateCreated;

  @override
  int get hashCode => guid.hashCode;

  @override
  bool operator ==(dynamic other) => other is ModelObject && guid == other.guid;

  const ModelObject(
      {@required this.guid, @required this.dateCreated, this.creatorGuid})
      : assert(guid != null),
        assert(dateCreated != null);

  static fromMap(Map<String, Object> map) {
    return ModelObject(
        guid: map[Key.guid],
        dateCreated: map[Key.dateCreated],
        creatorGuid: map[Key.creator]);
  }

  Map<String, Object> toMap() {
    return {Key.guid: guid};
  }
}
