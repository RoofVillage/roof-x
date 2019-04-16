import 'package:meta/meta.dart';
import 'package:feed_object/index.dart';
import 'package:fee_payer_type/index.dart';
import 'package:privacy_type/index.dart';
import 'package:expense/index.dart';
import 'package:user_reference/index.dart';
import 'package:task_reference/index.dart';
import 'package:name_user/index.dart';
import 'package:name_defining_object/index.dart';
import 'package:stub/index.dart';
import 'package:name_formatter/index.dart';
import 'package:key/index.dart' as _key;

class Completion extends FeedObject {
  final String name;
  final String note;
  final PrivacyType privacyType;
  final Set<UserReference> completingUsers;
  final TaskReference task;
  final Expense completionPrize;

  Completion(
      {Set<NameUser> contractDomainUsers,
      Set<NameUser> contractUsers,
      Set<NameUser> formerContractUsers,
      Set<Stub> contractStubs,
      Set<Stub> formerContractStubs,
      String contractPropertyName,
      FeePayerType feePayerType,
      String clientReferenceId,
      this.name,
      this.note,
      this.privacyType,
      this.completingUsers,
      this.task,
      this.completionPrize})
      : super(
            contractDomainUsers: contractDomainUsers,
            contractUsers: contractUsers,
            formerContractUsers: formerContractUsers,
            contractStubs: contractStubs,
            formerContractStubs: formerContractStubs,
            contractPropertyName: contractPropertyName,
            feePayerType: feePayerType,
            clientReferenceId: clientReferenceId);

  factory Completion.fromMap(Map<String, Object> map) {
    assert(map != null);

    final feedObject = FeedObject.fromMap(map);

    final completingUsers = (map[_key.completingUsers] as List)
        .map((map) => UserReference.fromMap(map));

    return Completion(
        contractDomainUsers: feedObject.contractDomainUsers,
        contractUsers: feedObject.contractUsers,
        formerContractUsers: feedObject.formerContractUsers,
        contractStubs: feedObject.contractStubs,
        formerContractStubs: feedObject.formerContractStubs,
        contractPropertyName: feedObject.contractPropertyName,
        feePayerType: feedObject.feePayerType,
        clientReferenceId: feedObject.clientReferenceId,
        name: map[_key.name],
        note: map[_key.note],
        privacyType: PrivacyType.fromString(map[_key.privacyKind]),
        completingUsers: completingUsers.toSet(),
        task: TaskReference.fromMap(map[_key.task]),
        completionPrize: Expense.fromMap(map[_key.prizeCompletion]));
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({
      _key.name: name,
      _key.note: note,
      _key.privacyKind: privacyType.toString(),
      _key.completingUsers:
          completingUsers.map((completingUser) => completingUser.toMap()),
      _key.task: task.toMap(),
      _key.prizeCompletion: completionPrize.toMap()
    });
    return map;
  }

  String formattedCompletingUsers({
    String sessionOwnerGuid,
    @required NameDefiningObject nameDefiningObject,
    bool firstPerson = false,
  }) {
    return formatNames(
        guids: completingUsers.map((user) => user.guid),
        sessionOwnerGuid: sessionOwnerGuid,
        nameDefiningObject: nameDefiningObject,
        firstPerson: firstPerson);
  }
}
