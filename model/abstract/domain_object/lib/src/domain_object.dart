import 'package:fee_payer_type/index.dart';
import 'package:model_object/index.dart';
import 'package:name_user/index.dart';
import 'package:stub/index.dart';
import 'package:name_defining_object/index.dart';
import 'package:name_context/index.dart';
import 'package:key/index.dart' as _key;

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
    final contract = map[_key.contract] as Map;
    final property = contract[_key.property] as Map;

    final contractDomainUsers = (contract[_key.domainUsers] as List)
        .map((map) => NameUser.fromMap(map));

    final contractUsers =
        (contract[_key.users] as List).map((map) => NameUser.fromMap(map));

    final formerContractUsers = (contract[_key.formerUsers] as List)
        .map((map) => NameUser.fromMap(map));

    final contractStubs =
        (contract[_key.stubs] as List).map((map) => Stub.fromMap(map));

    final formerContractStubs =
        (contract[_key.formerStubs] as List).map((map) => Stub.fromMap(map));
    return DomainObject(
        contractDomainUsers: contractDomainUsers.toSet(),
        contractUsers: contractUsers.toSet(),
        formerContractUsers: formerContractUsers.toSet(),
        contractStubs: contractStubs.toSet(),
        formerContractStubs: formerContractStubs.toSet(),
        contractPropertyName: property[_key.name],
        feePayerType: FeePayerType.fromString(map[_key.feePayerKind]));
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({
      _key.contract: {
        _key.domainUsers: contractDomainUsers
            .map((contractDomainUser) => contractDomainUser.toMap()),
        _key.users: contractUsers.map((contractUser) => contractUser.toMap()),
        _key.formerUsers: formerContractUsers
            .map((formerContractUser) => formerContractUser.toMap()),
        _key.stubs: contractStubs.map((contractStub) => contractStub.toMap()),
        _key.formerStubs: formerContractStubs
            .map((formerContractStubs) => formerContractStubs.toMap()),
        _key.feePayerKind: feePayerType.toString(),
        _key.property: {_key.name: contractPropertyName}
      }
    });
    return map;
  }
}
