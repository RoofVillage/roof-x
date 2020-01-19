import 'dart:convert';

import 'package:http/http.dart' as http;

mixin BlossmViewStore<View, HttpRes> {
  String get baseUrl;

  String get domain;

  String get route;

  View Function(HttpRes) get viewFromHttpResponse;

  Future<View> read() async {
    final url = 'https://views.$domain.$baseUrl/$route';

    return viewFromHttpResponse(
      await http.get(url).then(
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
