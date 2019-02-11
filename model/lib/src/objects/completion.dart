import 'package:types/index.dart';
import '../utils/index.dart';
import '../properties/index.dart';
import '../abstract/index.dart';

import 'stub.dart';
import 'expense.dart';

class Completion extends FeedObject {
  final String name;
  final String note;
  final PrivacyType privacyType;
  final List<UserReference> completingUsers;
  final TaskReference task;
  final Expense completionPrize;

  const Completion(
      {Domain domain,
      Contract contract,
      List<NameUser> contractDomainUsers,
      List<NameUser> contractUsers,
      List<NameUser> formerContractUsers,
      List<Stub> contractStubs,
      List<Stub> formerContractStubs,
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
            // domain: domain,
            // contract: contract,
            contractDomainUsers: contractDomainUsers,
            contractUsers: contractUsers,
            formerContractUsers: formerContractUsers,
            contractStubs: contractStubs,
            formerContractStubs: formerContractStubs,
            contractPropertyName: contractPropertyName,
            feePayerType: feePayerType,
            clientReferenceId: clientReferenceId);

  factory Completion.fromMap(Map<String, Object> map) {
    final feedObject = Completion.fromMap(map);
    final privacyType = PrivacyType.values.firstWhere(
        (value) => value.toString() == 'PrivacyType.' + map[Key.privacyKind]);
    return Completion(
        contractDomainUsers: feedObject.contractDomainUsers,
        contractUsers: feedObject.contractUsers,
        formerContractUsers: feedObject.formerContractUsers,
        contractStubs: feedObject.contractStubs,
        formerContractStubs: feedObject.formerContractStubs,
        contractPropertyName: feedObject.contractPropertyName,
        feePayerType: feedObject.feePayerType,
        clientReferenceId: feedObject.clientReferenceId,
        name: map[Key.name],
        note: map[Key.note],
        privacyType: privacyType,
        completingUsers: (map[Key.completingUsers] as List)
            .map((map) => UserReference.fromMap(map)),
        task: TaskReference.fromMap(map[Key.task]),
        completionPrize: Expense.fromMap(map[Key.prizeCompletion]));
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({
      Key.name: name,
      Key.note: note,
      Key.privacyKind: privacyType.toString().split(".").last,
      Key.completingUsers:
          completingUsers.map((completingUser) => completingUser.toMap()),
      Key.task: task.toMap(),
      Key.prizeCompletion: completionPrize.toMap()
    });
    return map;
  }
}
