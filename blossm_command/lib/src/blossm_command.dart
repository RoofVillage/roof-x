import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:network/index.dart';
import 'package:blossm_command/index.dart';
import 'package:blossm_command/src/utils/index.dart';
import 'package:blossm_command/src/utils/_params.dart' as params;

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

        if (data.containsKey(params.sessionToken)) {
          tokenStore.saveToken(data[params.sessionToken]);
        }
      },
    );
  }
}
