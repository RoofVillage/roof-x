import 'package:meta/meta.dart';
import 'package:strings/strings.dart';
import '../mixins/index.dart';

///"Anthony"
///"Anthony and Tyler"
///"Anthony, João, and Tyler"
///"All roommates"
///"All teammates"
///"All tenants"
///"All tenants and Mills Rentals"
///"Anthony, Tyler, and Mills Rentals"
String formatName(
    {@required List<String> guids,
    @required String sessionOwnerGuid,
    NameDefiningObject nameDefiningObject,
    bool useNicknames = true,
    bool useAllText = true,
    bool firstPerson = false}) {
  final orderedGuids = nameDefiningObject
      .orderedUserGuids(
        guids: guids,
        sessionOwnerGuid: sessionOwnerGuid,
        useNicknames: useNicknames,
      )
      .toSet()
      .toList();

  final orderedNames = [];

  final allUserGuids = nameDefiningObject.userGuids;
  if (orderedGuids.isNotEmpty &&
      useAllText &&
      allUserGuids.every((guid) => orderedGuids.contains(guid))) {
    orderedNames.add(capitalize(nameDefiningObject.allText));
    orderedGuids.removeWhere((guid) => allUserGuids.contains(guid));
  }

  final orderedUserNames = orderedGuids.map((guid) {
    return nameDefiningObject.nameForGuid(
        guid: guid,
        sessionOwnerGuid: sessionOwnerGuid,
        useNickname: useNicknames,
        firstPerson: firstPerson);
  }).toList();

  orderedNames.addAll(orderedUserNames);

  String result = "";

  for (var i = 0; i < orderedNames.length; i++) {
    final name = orderedNames[i];
    if (i == 0) {
      result += name;
    } else if (i == orderedGuids.length - 1) {
      if (orderedGuids.length == 2) {
        result += " and ";
      } else {
        result += ", and ";
      }
      result += name;
    } else {
      result += ", " + name;
    }
  }
  return result;
}
