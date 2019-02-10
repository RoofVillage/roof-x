import 'package:types/index.dart';
import '_name_context.dart';

class NameDomain extends NameContext {
  NameDomain({String guid, String name, ContextType type})
      : super(guid: guid, name: name, type: type);
  factory NameDomain.fromMap(Map<String, Object> map) {
    return NameContext.fromMap(map);
  }
}
