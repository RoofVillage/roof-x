import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  static const _jsonContentType = 'application/json';
  static const _jsonAccept = 'application/json';

  Future<String> post(
      {String address,
      Map<String, Object> params,
      Map<String, String> headers}) async {
    final Map<String, String> defaultHeaders = {
      'content-type': _jsonContentType,
      'accept': _jsonAccept
    };

    if (headers != null) {
      headers.addAll(defaultHeaders);
    } else {
      headers = defaultHeaders;
    }

    final response = await http.post(Uri.encodeFull(address),
        body: json.encode(params), headers: headers);

    print(response);

    switch (response.statusCode) {
      case 200:
        return utf8.decode(response.bodyBytes);
      default:
        throw Error();
    }
  }
}
