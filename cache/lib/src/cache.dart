import 'dart:async';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  Future<bool> saveString(
      {@required String string, @required String key}) async {
    SharedPreferences cache = await SharedPreferences.getInstance();
    return cache.setString(key, string);
  }

  Future<bool> removeValueForKey(String key) async {
    SharedPreferences cache = await SharedPreferences.getInstance();
    return cache.remove(key);
  }

  Future<String> stringForKey(String key) async {
    SharedPreferences cache = await SharedPreferences.getInstance();
    return cache.getString(key);
  }
}
