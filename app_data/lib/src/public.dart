import 'dart:async';

import 'utils/index.dart';
import '_param.dart' as _param;

class PublicActivity {
  Future<String> get(
      {num pageSize, num pageNumber = 0, num startTimestamp = 0}) async {
    final params = {
      _param.pageSize: pageSize,
      _param.pageNumber: pageNumber,
      _param.startTimestamp: startTimestamp
    };

    return await Api().post(service: Service.activity, params: params);
  }
}
