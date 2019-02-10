import '_name_user.dart';
import '../abstract/_domain.dart';
import '../utils/index.dart';

class DomainUser extends NameUser {
  final Domain domain;
  final Domain formerDomain;
  final String nickname;

  DomainUser(
      {String guid,
      String firstName,
      String lastName,
      this.domain,
      this.formerDomain,
      this.nickname})
      : super(guid: guid, firstName: firstName, lastName: lastName);

  factory DomainUser.fromMap(Map<String, Object> map) {
    final superMap = NameUser.fromMap(map);
    return DomainUser(
        guid: superMap.guid,
        firstName: superMap.firstName,
        lastName: superMap.lastName,
        domain: Domain.fromMap(map[Key.domain]),
        formerDomain: Domain.fromMap(map[Key.formerDomain]),
        nickname: map[Key.nickname]);
  }

  @override
  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({
      Key.domain: domain.toMap(),
      Key.formerDomain: formerDomain.toMap(),
      Key.nickname: nickname
    });

    return map;
  }
}
