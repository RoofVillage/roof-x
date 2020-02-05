import 'dart:async';
import 'dart:convert';
import 'dart:io';

// import 'package:http/http.dart' as http;

class Network {
  static const _jsonContentType = 'application/json';
  static const _jsonAccept = 'application/json';

  static Future<String> get({String address}) async {
    final HttpClientResponse response = await HttpClient()
        .getUrl(
          Uri.parse(address),
        )
        .then(
          (HttpClientRequest request) => request.close(),
        );

    print("GET response: $response");
    switch (response.statusCode) {
      case 200:
      // return utf8.decode(response.);
      default:
        throw Error();
    }
  }

  static Future<String> post({
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

    final response = await HttpClient().postUrl(Uri.parse(address)).then(
      (HttpClientRequest request) {
        request.write(params);
        headers.forEach(
          (key, value) => request.headers.add(key, value),
        );
      },
    );

    print("POST response: ${utf8.decode(response.bodyBytes)}");

    // for testing
    return Future.value(
      utf8.decode(response.bodyBytes),
    );

    switch (response.statusCode) {
      case 200:
        return Future.value(
          utf8.decode(response.bodyBytes),
        );
      default:
        throw Error();
    }
  }
}
