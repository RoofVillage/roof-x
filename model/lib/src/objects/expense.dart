import 'package:meta/meta.dart';
import 'package:types/index.dart';
import '../properties/index.dart';
import '../abstract/index.dart';
import '../utils/index.dart';
import '../mixins/index.dart';

import 'stub.dart';

class Expense extends Transaction {
  final Set<Splitter> payers;
  final Set<Splitter> splitters;
  final Set<ExpensePart> parts;
  final ThreadReference thread;
  final ExpenseType type;

  Expense(
      {Set<NameUser> contractDomainUsers,
      Set<NameUser> contractUsers,
      Set<NameUser> formerContractUsers,
      Set<Stub> contractStubs,
      Set<Stub> formerContractStubs,
      String contractPropertyName,
      FeePayerType feePayerType,
      String clientReferenceId,
      String name,
      String note,
      PrivacyType privacyType,
      Set<UserReference> completingUsers,
      TaskReference task,
      Expense completionPrize,
      int amount,
      this.payers,
      this.splitters,
      this.parts,
      this.thread,
      this.type})
      : super(
            contractDomainUsers: contractDomainUsers,
            contractUsers: contractUsers,
            formerContractUsers: formerContractUsers,
            contractStubs: contractStubs,
            formerContractStubs: formerContractStubs,
            contractPropertyName: contractPropertyName,
            feePayerType: feePayerType,
            clientReferenceId: clientReferenceId,
            name: name,
            note: note,
            privacyType: privacyType,
            completingUsers: completingUsers,
            task: task,
            completionPrize: completionPrize,
            amount: amount);

  factory Expense.fromMap(Map<String, Object> map) {
    assert(map != null);

    final transaction = Transaction.fromMap(map);
    final payers =
        (map[Key.payers] as List).map((map) => Splitter.fromMap(map));
    final splitters =
        (map[Key.splitters] as List).map((map) => Splitter.fromMap(map));
    final parts =
        (map[Key.parts] as List).map((map) => ExpensePart.fromMap(map));

    return Expense(
        contractDomainUsers: transaction.contractDomainUsers,
        contractUsers: transaction.contractUsers,
        formerContractUsers: transaction.formerContractUsers,
        contractStubs: transaction.contractStubs,
        formerContractStubs: transaction.formerContractStubs,
        contractPropertyName: transaction.contractPropertyName,
        feePayerType: transaction.feePayerType,
        clientReferenceId: transaction.clientReferenceId,
        name: transaction.name,
        note: transaction.note,
        privacyType: transaction.privacyType,
        completingUsers: transaction.completingUsers,
        task: transaction.task,
        completionPrize: transaction.completionPrize,
        payers: payers.toSet(),
        splitters: splitters.toSet(),
        parts: parts.toSet(),
        thread: ThreadReference.fromMap(map[Key.thread]),
        type: ExpenseType.fromString(map[Key.kind]));
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({
      Key.payers: payers.map((payer) => payer.toMap()),
      Key.splitters: splitters.map((splitter) => splitter.toMap()),
      Key.parts: parts.map((part) => part.toMap()),
      Key.thread: thread.toMap(),
      Key.kind: type.toString()
    });
    return map;
  }

  String formattedPayers({
    String sessionOwnerGuid,
    @required NameDefiningObject nameDefiningObject,
    bool firstPerson = false,
  }) {
    return formatName(
        guids: payers.map((payer) => payer.bankOwner.guid),
        sessionOwnerGuid: sessionOwnerGuid,
        nameDefiningObject: nameDefiningObject,
        firstPerson: firstPerson);
  }

  String formattedSplitter({
    String sessionOwnerGuid,
    @required NameDefiningObject nameDefiningObject,
    bool firstPerson = false,
  }) {
    return formatName(
        guids: splitters.map((splitter) => splitter.bankOwner.guid),
        sessionOwnerGuid: sessionOwnerGuid,
        nameDefiningObject: nameDefiningObject,
        firstPerson: firstPerson);
  }
}
