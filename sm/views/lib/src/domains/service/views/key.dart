import 'package:blossm_view_store/index.dart';
import 'package:views/src/domains/service/service_domain_config.dart';

class ServiceKeyViewStore
    with BlossmViewStore<ServiceKeyView, Map>, ServiceDomainConfig {
  @override
  String get route => "key";

  @override
  ServiceKeyView Function(Map) get viewFromHttpResponse => (Map map) {
        return ServiceKeyView(
          key: map["key"],
        );
      };
}

class ServiceKeyView {
  final String key;

  ServiceKeyView({
    this.key,
  });
}
