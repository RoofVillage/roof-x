import 'dart:convert';

import 'package:network/index.dart';
import 'package:synchronize/index.dart';

import 'address.dart';
import 'param.dart';

class Api {
  Future post({String address, Map<String, Object> params}) async {
    final response =
        await Network().post(address: Address.activity, params: params);
    final dataConvertedToJson = json.decode(response);
    final Map<String, Object> objectsToSync =
        dataConvertedToJson[Param.objectsToSync];
    Synchronizer().synchronize(objectsToSync);
  }
}
