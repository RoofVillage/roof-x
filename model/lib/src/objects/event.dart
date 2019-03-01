import 'package:meta/meta.dart';
import 'package:types/index.dart';
import '../utils/index.dart';
import '../properties/index.dart';
import '../abstract/index.dart';
import '../mixins/index.dart';

import 'stub.dart';

class Event extends FeedObject {
  final String detail;
  final String secondaryDetail;
  final Set<UserReference> actingUsers;
  final Set<UserReference> affectedUsers;
  final EventType type;
  final EventObjectType objectType;
  final String objectGuid;
  final Set<Metadata> metadata;

  Event(
      {Set<NameUser> contractDomainUsers,
      Set<NameUser> contractUsers,
      Set<NameUser> formerContractUsers,
      Set<Stub> contractStubs,
      Set<Stub> formerContractStubs,
      String contractPropertyName,
      FeePayerType feePayerType,
      String clientReferenceId,
      this.detail,
      this.secondaryDetail,
      this.actingUsers,
      this.affectedUsers,
      this.type,
      this.objectType,
      this.objectGuid,
      this.metadata})
      : super(
            contractDomainUsers: contractDomainUsers,
            contractUsers: contractUsers,
            formerContractUsers: formerContractUsers,
            contractStubs: contractStubs,
            formerContractStubs: formerContractStubs,
            contractPropertyName: contractPropertyName,
            feePayerType: feePayerType,
            clientReferenceId: clientReferenceId);

  factory Event.fromMap(Map<String, Object> map) {
    assert(map != null);

    final feedObject = FeedObject.fromMap(map);

    final actingUsers =
        (map[Key.actingUsers] as List).map((map) => UserReference.fromMap(map));

    final affectedUsers = (map[Key.affectedUsers] as List)
        .map((map) => UserReference.fromMap(map));

    final metadata =
        (map[Key.meta] as List).map((map) => Metadata.fromMap(map));

    return Event(
        contractDomainUsers: feedObject.contractDomainUsers,
        contractUsers: feedObject.contractUsers,
        formerContractUsers: feedObject.formerContractUsers,
        contractStubs: feedObject.contractStubs,
        formerContractStubs: feedObject.formerContractStubs,
        contractPropertyName: feedObject.contractPropertyName,
        feePayerType: feedObject.feePayerType,
        clientReferenceId: feedObject.clientReferenceId,
        detail: map[Key.detail],
        secondaryDetail: map[Key.secondaryDetail],
        actingUsers: actingUsers.toSet(),
        affectedUsers: affectedUsers.toSet(),
        type: EventType.fromString(map[Key.kind]),
        objectType: EventObjectType.fromString(map[Key.objectKind]),
        objectGuid: map[Key.objectGuid],
        metadata: metadata);
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({
      Key.detail: detail,
      Key.secondaryDetail: secondaryDetail,
      Key.actingUsers: actingUsers.map((actingUser) => actingUser.toMap()),
      Key.affectedUsers:
          affectedUsers.map((affectedUser) => affectedUser.toMap()),
      Key.kind: type.toString(),
      Key.objectKind: objectType.toString(),
      Key.objectGuid: objectGuid,
      Key.meta: metadata.map((metadata) => metadata.toMap())
    });
    return map;
  }

  String formattedActingUsers(
      {String sessionOwnerGuid,
      @required NameDefiningObject nameDefiningObject,
      bool firstPerson = false,
      bool useNicknames = true}) {
    return formatName(
        guids: actingUsers.map((user) => user.guid),
        sessionOwnerGuid: sessionOwnerGuid,
        nameDefiningObject: nameDefiningObject,
        useNicknames: useNicknames,
        firstPerson: firstPerson);
  }

  String formattedAffectedUsers(
      {String sessionOwnerGuid,
      @required NameDefiningObject nameDefiningObject,
      bool firstPerson = false,
      bool useNicknames = true}) {
    return formatName(
        guids: affectedUsers.map((user) => user.guid),
        sessionOwnerGuid: sessionOwnerGuid,
        nameDefiningObject: nameDefiningObject,
        useNicknames: useNicknames,
        firstPerson: firstPerson);
  }
}
