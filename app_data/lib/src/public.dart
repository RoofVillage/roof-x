import 'package:service/index.dart';

import 'utils/index.dart';

class PublicActivity {
  Future<String> get(
      {num pageSize, num pageNumber = 0, num startTimestamp = 0}) async {
    final params = {
      Param.pageSize: pageSize,
      Param.pageNumber: pageNumber,
      Param.startTimestamp: startTimestamp
    };

    return await Api().post(service: Service.activity, params: params);
  }
}
