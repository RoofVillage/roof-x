import 'dart:convert';

import 'package:http/http.dart' as http;

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
    return viewFromHttpResponse(
      await http.get(_url).then(
        (res) {
          return json.decode(res.body) as HttpRes;
        },
      ),
    );
  }

  Future<View> fakeResponse(View response) async {
    return Future.value(response);
  }
}
