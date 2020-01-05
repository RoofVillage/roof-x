import 'dart:async';
import 'dart:convert';

import 'package:synchronizer/index.dart';
import 'package:network/index.dart';
import 'package:session/index.dart' as _session;

import '../_param.dart' as _param;
import 'service.dart';

final _bearerTokenPrefix = 'Bearer ';
Future<String> post({Service service, Map<String, Object> params}) async {
  // params.addAll({_param.client: await DeviceInfo.params});

  if (service.doesNeedSession) {
    //refresh.
  }

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

  final response = await Network()
      .post(address: service.address, params: params, headers: headers);

  print(response);

  final Map<String, Object> dataConvertedToJson = json.decode(response);

  if (dataConvertedToJson.containsKey(_param.sessionToken) &&
      dataConvertedToJson.containsKey(_param.refreshToken)) {
    _session.start(
        sessionToken: dataConvertedToJson[_param.sessionToken],
        refreshToken: dataConvertedToJson[_param.refreshToken]);
  } else if (dataConvertedToJson.containsKey(_param.verificationToken)) {
    _session.standby(
        verificationToken: dataConvertedToJson[_param.verificationToken]);
  }
  final Map<String, Object> objectsToSync =
      dataConvertedToJson[_param.objectsToSync];

  await synchronize(objectsToSync);

  return response;
}

Map<String, Object> addStandardParams(Map<String, Object> params) {
  return params;
}
