import 'dart:async';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> get _cache async =>
    await SharedPreferences.getInstance();

Future<bool> saveString({@required String string, @required String key}) async {
  return (await _cache).setString(key, string);
}

Future<bool> removeValueForKey(String key) async {
  return (await _cache).remove(key);
}

Future<String> stringForKey(String key) async {
  return (await _cache).getString(key);
}
