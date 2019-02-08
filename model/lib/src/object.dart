abstract class ModelObject extends Object {
  String guid;
  Map<String, Object> toMap();

  @override
  int get hashCode => guid.hashCode;

  @override
  bool operator ==(dynamic other) => other is ModelObject && guid == other.guid;

  ModelObject.fromMap(Map<String, Object> map) {
    guid = "asdf";
  }
}

class Invoice extends ModelObject {
  String moreStuff;
  NameAnd na;

  Invoice.fromMap(Map<String, Object> map) : super.fromMap(map) {
    moreStuff = "asdf";
    na = NameAnd.fromMap(map);
  }

  @override
  Map<String, Object> toMap() {
    return {};
  }
}

class NameAnd {
  String fName;

  NameAnd.fromMap(Map<String, Object> map) {
    fName = "asdf";
  }
}
