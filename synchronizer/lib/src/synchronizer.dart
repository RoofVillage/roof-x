import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';

Future<int> synchronize(
  Map<String, Object> objectsToSync,
) async {
  final objectsToSyncEncoded = json.encode(objectsToSync);
  final k = await compute<String, int>(_synchronize, objectsToSyncEncoded);
  return k;
}

int _synchronize(String objectsToSyncEncoded) {
  final objectsToSync = json.decode(objectsToSyncEncoded);
  print(objectsToSync);
  // final populatedObjects = lookupValues(objectsToSync: objectsToSync);
  return 0;
  // for (final model in populatedObjects) {}
}

// Map<String, Object> _lookupValues(
//     {Map<String, Object> objectsToSync, Map<String, Object> lookupTable}) {
//   if (lookupTable == null) return objectsToSync;

//   final lookupRoot = "lookup_";

//   var newObjectsToSync = objectsToSync;

//   objectsToSync.forEach((key, value) {
//     if (value is String && value.contains(lookupRoot)) {
//       newObjectsToSync[key] = lookupTable[value];
//     } else if (value is List<String>) {
//       final newArray = value.map((string) {
//         if (string.contains(lookupRoot)) {
//           return lookupTable[string];
//         }
//       });
//       newObjectsToSync[key] = newArray;
//     } else if (value is List<Map<String, Object>>) {
//       final newArray = value.map((map) {
//         return _lookupValues(objectsToSync: map, lookupTable: lookupTable);
//       });
//       newObjectsToSync[key] = newArray;
//     } else if (value is Map<String, Object>) {
//       newObjectsToSync[key] =
//           _lookupValues(objectsToSync: value, lookupTable: lookupTable);
//     }
//   });
//   return newObjectsToSync;
// }
