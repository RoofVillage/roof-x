import 'package:meta/meta.dart';
import 'package:date/index.dart';

import 'package:mappable/index.dart';
import 'package:key/index.dart' as _key;

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
        guid: map[_key.guid],
        dateCreated: map[_key.dateCreated],
        creatorGuid: map[_key.creator]);
  }

  Map<String, Object> toMap() {
    return {_key.guid: guid};
  }
}
