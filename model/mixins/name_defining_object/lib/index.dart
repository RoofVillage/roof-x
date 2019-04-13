import 'package:strings/strings.dart';
import 'package:name_user/index.dart';
import 'package:name_context/index.dart';
import 'package:user_reference/index.dart';
import 'package:stub/index.dart';

mixin NameDefiningObject {
  Set<NameUser> get nameUsers => Set();
  Set<NameContext> get nameContexts => Set();
  Set<Stub> get stubs => Set();
  String get allText => null;
  Set<String> get userGuids => Set();

  String nameForUser({UserReference user, String sessionOwnerGuid}) {
    return nameForGuid(guid: user.guid, sessionOwnerGuid: sessionOwnerGuid);
  }

  String nameForGuid(
      {String guid,
      String sessionOwnerGuid,
      bool useNickname = false,
      bool firstPerson = false}) {
    final nameUser = nameUsers.firstWhere((nameUser) => nameUser.guid == guid);

    if (nameUser != null) {
      _nameForNameUser(
          nameUser: nameUser,
          sessionOwnerGuid: sessionOwnerGuid,
          useNickname: useNickname,
          firstPerson: firstPerson);
    }

    final stub = stubs.firstWhere((stub) => stub.guid == guid);
    if (stub != null && stub.objectGuid != null) {
      final nameUser =
          nameUsers.firstWhere((nameUser) => nameUser.guid == stub.objectGuid);
      if (nameUser != null) {
        _nameForNameUser(
            nameUser: nameUser,
            sessionOwnerGuid: sessionOwnerGuid,
            useNickname: useNickname,
            firstPerson: firstPerson);
      }
    }

    final nameContext =
        nameContexts.firstWhere((nameContext) => nameContext.guid == guid);

    if (nameContext != null) return nameContext.name;

    return null;
  }

  List<String> orderedUserGuids(
      {List<String> guids, String sessionOwnerGuid, bool useNicknames}) {
    guids.sort((a, b) {
      final nameContextGuids =
          nameContexts.map((nameContext) => nameContext.guid);
      if (sessionOwnerGuid == a || nameContextGuids.contains(b)) return -1;
      if (sessionOwnerGuid == b || nameContextGuids.contains(a)) return 1;

      final aName = nameForGuid(guid: a, useNickname: useNicknames);
      final bName = nameForGuid(guid: b, useNickname: useNicknames);
      if (aName == null) return -1;
      if (bName == null) return 1;
      return aName.compareTo(bName);
    });
    return guids;
  }

  String _nameForNameUser(
      {NameUser nameUser,
      String sessionOwnerGuid,
      bool useNickname,
      bool firstPerson}) {
    final name = useNickname ? nameUser.preferredName : nameUser.firstName;
    final isSessionOwner = nameUser.guid == sessionOwnerGuid;
    return firstPerson && isSessionOwner ? "you" : capitalize(name);
  }
}
