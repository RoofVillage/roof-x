import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class BlossmCommand {
  final String route;
  final String domain;
  final String baseUrl;
  final Map payload;

  BlossmCommand({
    @required this.route,
    @required this.domain,
    @required this.baseUrl,
    this.payload,
  });

  Future issue() {
    final url = "command.${domain.toString()}.$baseUrl/$route";
    return http.post(url, body: payload);
  }
}
