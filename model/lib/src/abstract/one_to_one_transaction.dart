import 'package:meta/meta.dart';
import 'package:types/index.dart';

import 'transaction.dart';
import '../properties/index.dart';
import '../objects/index.dart';
import '../utils/index.dart';
import '../abstract/index.dart';
import '../mixins/index.dart';
import '../key.dart' as _key;

class OneToOneTransaction extends Transaction {
  final BankOwnerReference receiver;
  final BankOwnerReference sender;

  OneToOneTransaction(
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
      this.receiver,
      this.sender})
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

  factory OneToOneTransaction.fromMap(Map<String, Object> map) {
    final transaction = Transaction.fromMap(map);

    return OneToOneTransaction(
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
      receiver: BankOwnerReference.fromMap(map[_key.receiver]),
      sender: BankOwnerReference.fromMap(map[_key.sender]),
    );
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({_key.receiver: receiver.toMap(), _key.sender: sender.toMap()});
    return map;
  }

  String formattedSender(
      {String sessionOwnerGuid,
      @required NameDefiningObject nameDefiningObject,
      bool firstPerson = false}) {
    return formatName(
        guids: [sender.guid],
        sessionOwnerGuid: sessionOwnerGuid,
        nameDefiningObject: nameDefiningObject,
        firstPerson: firstPerson);
  }

  String formattedReceiver(
      {String sessionOwnerGuid,
      @required NameDefiningObject nameDefiningObject,
      bool firstPerson = false}) {
    return formatName(
        guids: [receiver.guid],
        sessionOwnerGuid: sessionOwnerGuid,
        nameDefiningObject: nameDefiningObject,
        firstPerson: firstPerson);
  }
}
