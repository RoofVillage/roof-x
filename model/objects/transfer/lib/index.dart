import 'package:one_to_one_transaction/index.dart';
import 'package:fee_payer_type/index.dart';
import 'package:transfer_type/index.dart';
import 'package:transfer_status_type/index.dart';
import 'package:privacy_type/index.dart';
import 'package:expense/index.dart';
import 'package:user_reference/index.dart';
import 'package:task_reference/index.dart';
import 'package:name_user/index.dart';
import 'package:domain/index.dart';
import 'package:contract/index.dart';
import 'package:stub/index.dart';
import 'package:bank_owner_reference/index.dart';
import 'package:key/index.dart' as _key;

class Transfer extends OneToOneTransaction {
  final TransferType type;
  final TransferStatusType statusType;

  Transfer(
      {Domain domain,
      Contract contract,
      Set<NameUser> contractDomainUsers,
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
      BankOwnerReference receiver,
      BankOwnerReference sender,
      this.type,
      this.statusType})
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
            amount: amount,
            receiver: receiver,
            sender: sender);

  factory Transfer.fromMap(Map<String, Object> map) {
    assert(map != null);

    final oneToOneTransaction = OneToOneTransaction.fromMap(map);

    return Transfer(
        contractDomainUsers: oneToOneTransaction.contractDomainUsers,
        contractUsers: oneToOneTransaction.contractUsers,
        formerContractUsers: oneToOneTransaction.formerContractUsers,
        contractStubs: oneToOneTransaction.contractStubs,
        formerContractStubs: oneToOneTransaction.formerContractStubs,
        contractPropertyName: oneToOneTransaction.contractPropertyName,
        feePayerType: oneToOneTransaction.feePayerType,
        clientReferenceId: oneToOneTransaction.clientReferenceId,
        name: oneToOneTransaction.name,
        note: oneToOneTransaction.note,
        privacyType: oneToOneTransaction.privacyType,
        completingUsers: oneToOneTransaction.completingUsers,
        task: oneToOneTransaction.task,
        completionPrize: oneToOneTransaction.completionPrize,
        amount: oneToOneTransaction.amount,
        type: TransferType.fromString(map[_key.kind]),
        statusType: TransferStatusType.fromString(map[_key.statusKind]));
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll(
        {_key.kind: type.toString(), _key.statusKind: statusType.toString()});
    return map;
  }
}
