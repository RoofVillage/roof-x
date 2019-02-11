import 'package:types/index.dart';
import '../utils/index.dart';
import '../properties/index.dart';
import '../objects/index.dart';

import 'domain_object.dart';
import 'contract.dart';
import 'domain.dart';

class FeedObject extends DomainObject {
  final String clientReferenceId;

  const FeedObject(
      {Domain domain,
      Contract contract,
      List<NameUser> contractDomainUsers,
      List<NameUser> contractUsers,
      List<NameUser> formerContractUsers,
      List<Stub> contractStubs,
      List<Stub> formerContractStubs,
      String contractPropertyName,
      FeePayerType feePayerType,
      this.clientReferenceId})
      : super(
            // domain: domain,
            // contract: contract,
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
        clientReferenceId: map[Key.clientReferenceId]);
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({Key.clientReferenceId: clientReferenceId});
    return map;
  }
}
