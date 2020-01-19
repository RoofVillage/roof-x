import 'package:blossm_view_store/index.dart';
import 'package:views/src/domains/service/auth_domain_config.dart';

class ServiceDashboardViewStore
    with BlossmViewStore<ServiceDashboardView, Map>, ServiceDomainConfig {
  @override
  String get route => "service";

  @override
  ServiceDashboardView Function(Map) get viewFromHttpResponse => (Map map) {
        return ServiceDashboardView(
          name: map["name"],
        );
      };
}

class ServiceDashboardView {
  final String name;

  ServiceDashboardView({
    this.name,
  });
}
