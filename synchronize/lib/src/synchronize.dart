import 'dart:convert';
import 'package:flutter/foundation.dart';

class Synchronizer {
  void synchronize(Map<String, Object> objectsToSync, ) async {
    final _ =
        await compute<Map<String, Object>, int>(_synchronize, objectsToSync);
  }

  int _synchronize(Map<String, Object> objectsToSync ) {
    final populatedObjects = lookupValues(objectsToSync: objectsToSync)
    for (final model in objectsToSync) {

    }
  }

  Map<String, Object> lookupValues({Map<String, Object> objectsToSync, Map<String, Object> lookupTable}) {
    return objectsToSync;
  }
  // private func lookupJSONValuesFromLookupTable(json: JSON, lookupObject: JSON?) -> JSON {
  //       guard let lookupObject = lookupObject else { return json }

  //       let lookupRoot = "lookup_"

  //       var newJSON = json
  //       for (key, value) in json {
  //           if let string = value as? String,
  //               string.range(of: lookupRoot) != nil,
  //               let lookupValue = lookupObject[string] {
  //               newJSON[key] = lookupValue
  //           } else if let stringArray = value as? [String] {
  //               let newArray: [Any] = stringArray.map({ string in
  //                   if string.range(of: lookupRoot) != nil,
  //                       let lookupValue = lookupObject[string] {
  //                       return lookupValue
  //                   }
  //                   return string
  //               })

  //               newJSON[key] = newArray
  //           } else if let jsonArray = value as? [JSON] {
  //               let newArray: [Any] = jsonArray.map({ json in
  //                   let newObject: JSON = lookupJSONValuesFromLookupTable(
  //                       json: json,
  //                       lookupObject: lookupObject
  //                   )
  //                   return newObject
  //               })

  //               newJSON[key] = newArray

  //           } else if let object = value as? JSON {
  //               let newObject: JSON = lookupJSONValuesFromLookupTable(
  //                   json: object,
  //                   lookupObject: lookupObject
  //               )
  //               newJSON[key] = newObject
  //           }
  //       }
  //       return newJSON
  //   }V
}
