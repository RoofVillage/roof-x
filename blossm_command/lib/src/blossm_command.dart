import 'dart:convert';

import 'package:blossm_command/src/utils/fake_command_response.dart';
import 'package:flutter/material.dart';
import 'package:network/index.dart';
import 'package:blossm_command/index.dart';
import 'package:blossm_command/src/utils/index.dart';

class BlossmCommand {
  final String route;
  final String domain;
  final String baseUrl;
  final Map payload;
  final TokenStore tokenStore;

  BlossmCommand({
    @required this.route,
    @required this.domain,
    @required this.baseUrl,
    this.payload,
    this.tokenStore,
  });

  String get _tokenKey => tokenStore.tokenKey;

  Future fakeSuccess({Map response}) async {
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

  Future fakeError({Object response}) async {
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

  Future issue() async {
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

    return Network.post(address: url, params: body, headers: headers).then(
      (response) {
        final Map data = json.decode(response);

        if (tokenStore != null &&
            _tokenKey != null &&
            data.containsKey(_tokenKey)) {
          tokenStore.saveToken(data[_tokenKey]);
        }
      },
    );
  }
}
