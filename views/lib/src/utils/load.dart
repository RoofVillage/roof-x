import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const baseUrl = "core.staging.sm.network";

Future<T> readViewData<T>({
  @required String domain,
  @required String route,
}) async {
  final url = 'https://views.$domain.$baseUrl/$route';

  return http.get(url).then(
    (res) {
      return json.decode(res.body) as T;
    },
  );
}
