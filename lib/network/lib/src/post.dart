import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:network/src/post_response.dart';

class Network {
  static const _jsonContentType = 'application/json';
  static const _jsonAccept = 'application/json';

  static Future<Map> get({String address}) async {
    final response = await http.get(Uri.encodeFull(address));

    print("GET response: $response");
    switch (response.statusCode) {
      case 200:
        return json.decode(
          utf8.decode(response.bodyBytes),
        );
      default:
        throw Error();
    }
  }

  static Future<PostResponse> post({
    String address,
    Map<String, Object> params,
    Map<String, String> headers,
  }) async {
    print("POST address: $address");
    print("POST params: $params");
    print("POST headers: $headers");

    final Map<String, String> defaultHeaders = {
      'content-type': _jsonContentType,
      'accept': _jsonAccept
    };

    if (headers != null) {
      headers.addAll(defaultHeaders);
    } else {
      headers = defaultHeaders;
    }

    final response = await http.post(
      Uri.encodeFull(address),
      body: json.encode(params),
      headers: headers,
    );

    final decodedBodyBytes = utf8.decode(response.bodyBytes);

    final PostResponse postResponse = PostResponse(
      body: (decodedBodyBytes != null && decodedBodyBytes.isNotEmpty) ? json.decode(decodedBodyBytes) : null,
      headers: response.headers,
      statusCode: response.statusCode,
    );

    print('POST complete');
    return Future.value(postResponse);
  }
}
