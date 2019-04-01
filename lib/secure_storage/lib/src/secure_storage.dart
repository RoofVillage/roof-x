import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';

Future<void> save({@required String value, @required String key}) async {
  final storage = FlutterSecureStorage();
  return await storage.write(key: key, value: value);
}

Future<void> removeValueForKey(String key) async {
  final storage = FlutterSecureStorage();
  return await storage.delete(key: key);
}

Future<String> valueForKey(String key) async {
  final storage = FlutterSecureStorage();
  return await storage.read(key: key);
}
