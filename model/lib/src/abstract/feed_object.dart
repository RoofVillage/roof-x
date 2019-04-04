import 'package:types/index.dart';

import 'domain_object.dart';
import '../properties/index.dart';
import '../objects/index.dart';
import '../key.dart' as _key;

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
