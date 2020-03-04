import 'package:network/index.dart';

mixin BlossmViewStore<View, HttpRes> {
  String get baseUrl;
  String get domain;
  String get route;
  View Function(HttpRes) get viewFromHttpResponse;

  String get _url => 'https://views.$domain.$baseUrl/$route';

  Stream<View> listen() {
    return Stream.fromFutures(
      [read()],
    );
  }

  Stream<View> fakeListen(View initialValue) {
    return Stream<View>.fromFutures(
      [fakeResponse(initialValue)],
    );
  }

  Future<View> read() async {
    final HttpRes response = await Network.get(
      address: _url,
    ) as HttpRes;

    return viewFromHttpResponse(response);
  }

  Future<View> fakeResponse(View response) async {
    return Future.value(response);
  }
}
