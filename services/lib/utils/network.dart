import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  static const _contentType = 'application/json';
  static const _accept = 'application/json';

  Future post({String url, Map<String, Object> body}) async {
    final response = await http.post(Uri.encodeFull(url),
        body: json.encode(body),
        headers: {'content-type': _contentType, 'accept': _accept});
    switch (response.statusCode) {
      case 200:
        return utf8.decode(response.bodyBytes);
      default:
        throw Error();
    }
  }
}
