import 'dart:io';
import 'dart:convert';
import 'dart:collection';

import 'package:path_provider/path_provider.dart';

//For more on SplayTrees, see https://api.dartlang.org/stable/2.1.0/dart-collection/SplayTreeMap-class.html.
class Storage {
  static SplayTreeMap _loadedStorageMap;

  static SplayTreeMap get read => _loadedStorageMap;

  static Future<SplayTreeMap> get load async {
    if (read != null) return Future.value(read);

    final file = await _localFile;
    // Read the file
    String contents = await file.readAsString();
    final map = json.decode(contents);
    _loadedStorageMap = map;
    return read;
  }

  static Future<File> write(SplayTreeMap map) async {
    final file = await _localFile;

    // Write the file
    final updatedFile = await file.writeAsString(json.encode(map));
    _loadedStorageMap = map;
    return updatedFile;
  }

  static Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/cache.json');
  }
}
