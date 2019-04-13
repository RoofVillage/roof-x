import 'package:context_type/index.dart';
import 'package:name_context/index.dart';

class NameDomain extends NameContext {
  NameDomain({String guid, String name, ContextType type})
      : super(guid: guid, name: name, type: type);
  factory NameDomain.fromMap(Map<String, Object> map) {
    return NameContext.fromMap(map);
  }
}
