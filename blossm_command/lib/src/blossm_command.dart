import 'package:blossm_command/src/utils/fake_command_response.dart';
import 'package:blossm_command/src/utils/response.dart';
import 'package:flutter/material.dart';
import 'package:network/index.dart';
import 'package:blossm_command/index.dart';
import 'package:blossm_command/src/utils/index.dart';

abstract class BlossmCommandDispatcher {
  static const _cookieKey = 'set-cookie';
  static const _sessionTokenPrefix = 'session=';
  
  String get domain;
  String get baseUrl;
  TokenStore get tokenStore;

  // This method is called whenever a command is issued without a valid authentication token.
  Future<void> Function() get onTokenInvalid;

  Future dispatch({@required String route, Map payload}) async {
    final url = "https://command.$domain.$baseUrl/$route";

    final Map<String, String> headers = {};

    final String token = await tokenStore.readToken();

    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }

    final Map<String, Object> body = {
      "payload": payload,
      "headers": {
        "issued": DateTime.now().toIso8601String(),
      },
    };

    final response = await Network.post(
      address: url,
      params: body,
      headers: headers,
    );

    final BlossmResponse data = BlossmResponse.fromMap(response.body);

    if (data.statusCode == 401) {
      onTokenInvalid();
      return;
    }

    final String cookie = response.headers[_cookieKey];

    final String newToken = cookie?.split(_sessionTokenPrefix)[1];

    if (tokenStore != null && newToken != null) {
      tokenStore.saveToken(newToken);
    }

    return Future.value(response);
  }

  Future fakeSuccess({
    @required String route,
    @required Map payload,
    @required Map response,
  }) async {
    print(
      "Faking success from command with route '$route' and payload: $payload",
    );

    return Future.delayed(
      Duration(milliseconds: 500),
      () => FakeCommandResponse(
        status: "200",
        body: response,
      ),
    );
  }

  Future fakeError({
    @required String route,
    @required Map payload,
    @required Map response,
  }) async {
    print(
      "Faking error from command with route '$route' and payload: $payload",
    );

    return Future.delayed(
      Duration(milliseconds: 500),
      () => {
        "status": '400',
        "body": response,
      },
    );
  }
}
