import 'package:views/src/utils/index.dart';

mixin ViewStore<View, HttpRes> {
  String get domain;
  String get route;
  View Function(HttpRes) get viewFromHttpResponse;

  Future<View> read() async {
    return viewFromHttpResponse(
      await readViewData<HttpRes>(route: route, domain: domain),
    );
  }
}
