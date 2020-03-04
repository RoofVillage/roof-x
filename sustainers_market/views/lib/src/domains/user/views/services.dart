import 'package:blossm_view_store/index.dart';
import 'package:views/src/domains/user/user_domain_config.dart';

class UserServicesViewStore
    with BlossmViewStore<UserServicesView, Map>, UserDomainConfig {
  @override
  String get route => "key";

  @override
  UserServicesView Function(Map) get viewFromHttpResponse => (Map map) {
        return UserServicesView(
          services: map["services"],
        );
      };
}

class UserServicesView {
  final List<UserServiceView> services;

  UserServicesView({
    this.services,
  });
}

class UserServiceView {
  final String name;

  UserServiceView({
    this.name,
  });
}
