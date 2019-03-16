import 'dart:convert';

import 'package:network/index.dart';
import 'package:synchronizer/index.dart';
import 'package:service/index.dart';
import 'package:session/index.dart';

import '_device_info.dart';

class Api {
  final _bearerTokenPrefix = 'Bearer ';
  Future<String> post({Service service, Map<String, Object> params}) async {
    print(await DeviceInfo.params);
    // params.addAll({Param.client: await DeviceInfo.params});

    if (service.doesNeedSession) {
      //refresh.
    }

    Map<String, String> headers;
    final token = await Session.token;
    if (token != null) {
      headers[Param.authorizationHeader] = _bearerTokenPrefix + token;
    } else if (service.doesNeedSession) {
      throw ArgumentError.value(
        service,
        'service',
        "Service cannot be accessed without an active session.",
      );
    }

    final response = await Network()
        .post(address: service.address, params: params, headers: headers);

    final Map<String, Object> dataConvertedToJson = json.decode(response);

    if (dataConvertedToJson.containsKey(Param.sessionToken) &&
        dataConvertedToJson.containsKey(Param.refreshToken)) {
      Session.start(
          sessionToken: dataConvertedToJson[Param.sessionToken],
          refreshToken: dataConvertedToJson[Param.refreshToken]);
    } else if (dataConvertedToJson.containsKey(Param.verificationToken)) {
      Session.standby(
          verificationToken: dataConvertedToJson[Param.verificationToken]);
    }
    final Map<String, Object> objectsToSync =
        dataConvertedToJson[Param.objectsToSync];

    await Synchronizer().synchronize(objectsToSync);

    return response;
  }

  Map<String, Object> addStandardParams(Map<String, Object> params) {
    return params;
  }
}
