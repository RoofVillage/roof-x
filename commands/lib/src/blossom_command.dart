import 'package:flutter/material.dart';

const baseUrl = "core.roof.io";

class BlossomCommand {
  final String domain;
  final String address;
  final Map<String, String> payload;

  BlossomCommand({
    @required this.domain,
    @required this.address,
    this.payload,
  });

  Future issue() {
    final url = "command.${domain.toString()}.$baseUrl/$address";
    print('http URL $url');
    // TODO send http
    return Future.delayed(Duration(seconds: 1));
  }
}
