import 'package:meta/meta.dart';
import 'package:expense_type/index.dart';
import 'package:fee_payer_type/index.dart';
import 'package:privacy_type/index.dart';
import 'package:transaction/index.dart';
import 'package:splitter/index.dart';
import 'package:expense_part/index.dart';
import 'package:thread_reference/index.dart';
import 'package:user_reference/index.dart';
import 'package:task_reference/index.dart';
import 'package:name_user/index.dart';
import 'package:name_defining_object/index.dart';
import 'package:stub/index.dart';
import 'package:name_formatter/index.dart';
import 'package:key/index.dart' as _key;

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
        (map[_key.payers] as List).map((map) => Splitter.fromMap(map));
    final splitters =
        (map[_key.splitters] as List).map((map) => Splitter.fromMap(map));
    final parts =
        (map[_key.parts] as List).map((map) => ExpensePart.fromMap(map));

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
        thread: ThreadReference.fromMap(map[_key.thread]),
        type: ExpenseType.fromString(map[_key.kind]));
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({
      _key.payers: payers.map((payer) => payer.toMap()),
      _key.splitters: splitters.map((splitter) => splitter.toMap()),
      _key.parts: parts.map((part) => part.toMap()),
      _key.thread: thread.toMap(),
      _key.kind: type.toString()
    });
    return map;
  }

  String formattedPayers({
    String sessionOwnerGuid,
    @required NameDefiningObject nameDefiningObject,
    bool firstPerson = false,
  }) {
    return formatNames(
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
    return formatNames(
        guids: splitters.map((splitter) => splitter.bankOwner.guid),
        sessionOwnerGuid: sessionOwnerGuid,
        nameDefiningObject: nameDefiningObject,
        firstPerson: firstPerson);
  }
}
