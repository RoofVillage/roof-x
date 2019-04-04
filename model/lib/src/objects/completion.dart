import 'package:meta/meta.dart';
import 'package:types/index.dart';

import 'stub.dart';
import 'expense.dart';
import '../utils/index.dart';
import '../properties/index.dart';
import '../abstract/index.dart';
import '../mixins/index.dart';
import '../key.dart' as _key;

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
    return formatName(
        guids: completingUsers.map((user) => user.guid),
        sessionOwnerGuid: sessionOwnerGuid,
        nameDefiningObject: nameDefiningObject,
        firstPerson: firstPerson);
  }
}
