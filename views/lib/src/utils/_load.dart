import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, Object>> loadViewData(String address) async {
  final url = 'https://views/$address';

  return http.get(url).then(
    (res) {
      return json.decode(res.body);
    },
  );
}
