import 'dart:async';

import 'package:network/index.dart';
import 'package:session/index.dart' as _session;

import '../_param.dart' as _param;
import 'service.dart';

final _bearerTokenPrefix = 'Bearer ';
Future<PostResponse> post({Service service, Map<String, Object> params}) async {
  Map<String, String> headers;
  final token = await _session.token;
  if (token != null) {
    headers[_param.authorizationHeader] = _bearerTokenPrefix + token;
  } else if (service.doesNeedSession) {
    throw ArgumentError.value(
      service,
      'service',
      "Service cannot be accessed without an active session.",
    );
  }

  final response = await Network.post(
    address: service.address,
    params: params,
    headers: headers,
  );

  return response;
}

Map<String, Object> addStandardParams(Map<String, Object> params) {
  return params;
}
