import 'package:fee_payer_type/index.dart';

import 'package:key/index.dart' as _key;
import 'package:domain_object/index.dart';
import 'package:name_user/index.dart';
import 'package:stub/index.dart';

class FeedObject extends DomainObject {
  final String clientReferenceId;

  FeedObject(
      {Set<NameUser> contractDomainUsers,
      Set<NameUser> contractUsers,
      Set<NameUser> formerContractUsers,
      Set<Stub> contractStubs,
      Set<Stub> formerContractStubs,
      String contractPropertyName,
      FeePayerType feePayerType,
      this.clientReferenceId})
      : super(
            contractDomainUsers: contractDomainUsers,
            contractUsers: contractUsers,
            formerContractUsers: formerContractUsers,
            contractStubs: contractStubs,
            formerContractStubs: formerContractStubs,
            contractPropertyName: contractPropertyName,
            feePayerType: feePayerType);

  factory FeedObject.fromMap(Map<String, Object> map) {
    final domainObject = DomainObject.fromMap(map);
    return FeedObject(
        contractDomainUsers: domainObject.contractDomainUsers,
        contractUsers: domainObject.contractUsers,
        formerContractUsers: domainObject.formerContractUsers,
        contractStubs: domainObject.contractStubs,
        formerContractStubs: domainObject.formerContractStubs,
        contractPropertyName: domainObject.contractPropertyName,
        feePayerType: domainObject.feePayerType,
        clientReferenceId: map[_key.clientReferenceId]);
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({_key.clientReferenceId: clientReferenceId});
    return map;
  }
}
