import 'package:types/index.dart';
import '../utils/index.dart';
import '../properties/index.dart';
import '../objects/index.dart';
import '../mixins/index.dart';

import 'model_object.dart';

class DomainObject extends ModelObject with NameDefiningObject {
  final Set<NameUser> contractDomainUsers;
  final Set<NameUser> contractUsers;
  final Set<NameUser> formerContractUsers;
  final Set<Stub> contractStubs;
  final Set<Stub> formerContractStubs;
  final String contractPropertyName;
  final FeePayerType feePayerType;

  @override
  String get allText => "Everyone";

  @override
  Set<NameUser> get nameUsers {
    return contractDomainUsers
        .followedBy(contractUsers)
        .followedBy(formerContractUsers);
  }

  @override
  Set<NameContext> get nameContexts => Set();

  @override
  Set<Stub> get stubs => contractStubs.followedBy(formerContractStubs);

  DomainObject(
      {this.contractDomainUsers,
      this.contractUsers,
      this.formerContractUsers,
      this.contractStubs,
      this.formerContractStubs,
      this.contractPropertyName,
      this.feePayerType});

  factory DomainObject.fromMap(Map<String, Object> map) {
    final contract = map[Key.contract] as Map;
    final property = contract[Key.property] as Map;

    final contractDomainUsers =
        (contract[Key.domainUsers] as List).map((map) => NameUser.fromMap(map));

    final contractUsers =
        (contract[Key.users] as List).map((map) => NameUser.fromMap(map));

    final formerContractUsers =
        (contract[Key.formerUsers] as List).map((map) => NameUser.fromMap(map));

    final contractStubs =
        (contract[Key.stubs] as List).map((map) => Stub.fromMap(map));

    final formerContractStubs =
        (contract[Key.formerStubs] as List).map((map) => Stub.fromMap(map));
    return DomainObject(
        contractDomainUsers: contractDomainUsers.toSet(),
        contractUsers: contractUsers.toSet(),
        formerContractUsers: formerContractUsers.toSet(),
        contractStubs: contractStubs.toSet(),
        formerContractStubs: formerContractStubs.toSet(),
        contractPropertyName: property[Key.name],
        feePayerType: FeePayerType.fromString(map[Key.feePayerKind]));
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({
      Key.contract: {
        Key.domainUsers: contractDomainUsers
            .map((contractDomainUser) => contractDomainUser.toMap()),
        Key.users: contractUsers.map((contractUser) => contractUser.toMap()),
        Key.formerUsers: formerContractUsers
            .map((formerContractUser) => formerContractUser.toMap()),
        Key.stubs: contractStubs.map((contractStub) => contractStub.toMap()),
        Key.formerStubs: formerContractStubs
            .map((formerContractStubs) => formerContractStubs.toMap()),
        Key.feePayerKind: feePayerType.toString(),
        Key.property: {Key.name: contractPropertyName}
      }
    });
    return map;
  }
}
