import 'package:types/index.dart';
import '../utils/index.dart';
import '../properties/index.dart';
import '../objects/index.dart';

import 'object.dart';
import 'contract.dart';
import 'domain.dart';

class DomainObject extends ModelObject {
  // final Domain domain;
  // final Contract contract;
  final List<NameUser> contractDomainUsers;
  final List<NameUser> contractUsers;
  final List<NameUser> formerContractUsers;
  final List<Stub> contractStubs;
  final List<Stub> formerContractStubs;
  final String contractPropertyName;
  final FeePayerType feePayerType;

  const DomainObject(
      {
      //   this.domain,
      // this.contract,
      this.contractDomainUsers,
      this.contractUsers,
      this.formerContractUsers,
      this.contractStubs,
      this.formerContractStubs,
      this.contractPropertyName,
      this.feePayerType});

  factory DomainObject.fromMap(Map<String, Object> map) {
    final contract = map[Key.contract] as Map;
    final property = contract[Key.property] as Map;
    return DomainObject(
        contractDomainUsers: (contract[Key.domainUsers] as List)
            .map((map) => NameUser.fromMap(map)),
        contractUsers:
            (contract[Key.users] as List).map((map) => NameUser.fromMap(map)),
        formerContractUsers: (contract[Key.formerUsers] as List)
            .map((map) => NameUser.fromMap(map)),
        contractStubs:
            (contract[Key.stubs] as List).map((map) => Stub.fromMap(map)),
        formerContractStubs:
            (contract[Key.formerStubs] as List).map((map) => Stub.fromMap(map)),
        contractPropertyName: property[Key.name],
        feePayerType: contract[Key.feePayerKind]);
  }

  Map<String, Object> toMap() {
    final map = {
      Key.contract: {
        Key.domainUsers: contractDomainUsers
            .map((contractDomainUser) => contractDomainUser.toMap()),
        Key.users: contractUsers.map((contractUser) => contractUser.toMap()),
        Key.formerUsers: formerContractUsers
            .map((formerContractUser) => formerContractUser.toMap()),
        Key.stubs: contractStubs.map((contractStub) => contractStub.toMap()),
        Key.formerStubs: formerContractStubs
            .map((formerContractStubs) => formerContractStubs.toMap()),
        Key.feePayerKind: feePayerType.toString().split(".").last,
        Key.property: {Key.name: contractPropertyName}
      }
    };
    return map;
  }
}
