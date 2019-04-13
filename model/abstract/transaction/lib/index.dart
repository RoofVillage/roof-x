import 'package:fee_payer_type/index.dart';
import 'package:privacy_type/index.dart';

import 'package:user_reference/index.dart';
import 'package:stub/index.dart';
import 'package:expense/index.dart';
import 'package:completion/index.dart';
import 'package:name_user/index.dart';
import 'package:task_reference/index.dart';
import 'package:key/index.dart' as _key;

class Transaction extends Completion {
  final int amount;

  Transaction(
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
      this.amount})
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
            completionPrize: completionPrize);

  factory Transaction.fromMap(Map<String, Object> map) {
    final completion = Completion.fromMap(map);

    return Transaction(
        contractDomainUsers: completion.contractDomainUsers,
        contractUsers: completion.contractUsers,
        formerContractUsers: completion.formerContractUsers,
        contractStubs: completion.contractStubs,
        formerContractStubs: completion.formerContractStubs,
        contractPropertyName: completion.contractPropertyName,
        feePayerType: completion.feePayerType,
        clientReferenceId: completion.clientReferenceId,
        name: completion.name,
        note: completion.note,
        privacyType: completion.privacyType,
        completingUsers: completion.completingUsers,
        task: completion.task,
        completionPrize: completion.completionPrize,
        amount: map[_key.amount]);
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({
      _key.amount: amount,
    });
    return map;
  }
}
