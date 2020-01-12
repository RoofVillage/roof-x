import 'dart:convert';

import 'package:blossm_command/src/utils/token_storer.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

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

  Future issue() {
    final url = "command.${domain.toString()}.$baseUrl/$route";

    final Map<String, String> headers = {};

    final String token = tokenStore.readToken();

    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }

    return http.post(url, body: payload, headers: headers).then(
      (response) {
        final Map data = json.decode(response.body);

        if (data["token"] != null) {
          tokenStore.saveToken(data["token"]);
        }
      },
    );
  }
}
