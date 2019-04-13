import 'package:meta/meta.dart';
import 'package:fee_payer_type/index.dart';
import 'package:event_type/index.dart';
import 'package:event_object_type/index.dart';
import 'package:feed_object/index.dart';
import 'package:metadata/index.dart';
import 'package:user_reference/index.dart';
import 'package:name_user/index.dart';
import 'package:name_defining_object/index.dart';
import 'package:stub/index.dart';
import 'package:name_formatter/index.dart';
import 'package:key/index.dart' as _key;

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

    final actingUsers = (map[_key.actingUsers] as List)
        .map((map) => UserReference.fromMap(map));

    final affectedUsers = (map[_key.affectedUsers] as List)
        .map((map) => UserReference.fromMap(map));

    final metadata =
        (map[_key.meta] as List).map((map) => Metadata.fromMap(map));

    return Event(
        contractDomainUsers: feedObject.contractDomainUsers,
        contractUsers: feedObject.contractUsers,
        formerContractUsers: feedObject.formerContractUsers,
        contractStubs: feedObject.contractStubs,
        formerContractStubs: feedObject.formerContractStubs,
        contractPropertyName: feedObject.contractPropertyName,
        feePayerType: feedObject.feePayerType,
        clientReferenceId: feedObject.clientReferenceId,
        detail: map[_key.detail],
        secondaryDetail: map[_key.secondaryDetail],
        actingUsers: actingUsers.toSet(),
        affectedUsers: affectedUsers.toSet(),
        type: EventType.fromString(map[_key.kind]),
        objectType: EventObjectType.fromString(map[_key.objectKind]),
        objectGuid: map[_key.objectGuid],
        metadata: metadata);
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({
      _key.detail: detail,
      _key.secondaryDetail: secondaryDetail,
      _key.actingUsers: actingUsers.map((actingUser) => actingUser.toMap()),
      _key.affectedUsers:
          affectedUsers.map((affectedUser) => affectedUser.toMap()),
      _key.kind: type.toString(),
      _key.objectKind: objectType.toString(),
      _key.objectGuid: objectGuid,
      _key.meta: metadata.map((metadata) => metadata.toMap())
    });
    return map;
  }

  String formattedActingUsers(
      {String sessionOwnerGuid,
      @required NameDefiningObject nameDefiningObject,
      bool firstPerson = false,
      bool useNicknames = true}) {
    return formatNames(
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
    return formatNames(
        guids: affectedUsers.map((user) => user.guid),
        sessionOwnerGuid: sessionOwnerGuid,
        nameDefiningObject: nameDefiningObject,
        useNicknames: useNicknames,
        firstPerson: firstPerson);
  }
}
