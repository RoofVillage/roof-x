import '_name_user.dart';
import '../abstract/index.dart';
import '../utils/index.dart';

class ContractUser extends NameUser {
  final int amount;
  final Contract contract;

  ContractUser(
      {String guid,
      String firstName,
      String lastName,
      this.contract,
      this.amount})
      : super(guid: guid, firstName: firstName, lastName: lastName);

  factory ContractUser.fromMap(Map<String, Object> map) {
    final nameUser = NameUser.fromMap(map);
    return ContractUser(
        guid: nameUser.guid,
        firstName: nameUser.firstName,
        lastName: nameUser.lastName,
        contract: Contract.fromMap(map[Key.contract]),
        amount: map[Key.amount]);
  }

  @override
  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({Key.contract: contract.toMap(), Key.amount: amount});

    return map;
  }
}
