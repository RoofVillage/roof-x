import 'package:blossm_view_store/index.dart';
import 'package:views/src/domains/service/service_domain_config.dart';

class ServiceDashboardViewStore
    with BlossmViewStore<ServiceDashboardView, Map>, ServiceDomainConfig {
  @override
  String get route => "serviceDashboard";

  @override
  ServiceDashboardView Function(Map) get viewFromHttpResponse => (Map map) {
        return ServiceDashboardView(
          name: map["name"],
          keys: map["keys"],
        );
      };
}

class ServiceDashboardView {
  final String name;
  final List<String> keys;

  ServiceDashboardView({
    this.name,
    this.keys,
  });
}
