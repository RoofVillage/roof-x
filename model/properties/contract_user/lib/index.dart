import 'package:name_user/index.dart';
import 'package:key/index.dart' as _key;
import 'package:contract/index.dart';

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
        contract: Contract.fromMap(map[_key.contract]),
        amount: map[_key.amount]);
  }

  @override
  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({_key.contract: contract.toMap(), _key.amount: amount});

    return map;
  }
}
