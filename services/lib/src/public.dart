import 'package:network/index.dart';
import 'address.dart';

import 'param.dart';

class GetPublicActivity {
  Future<String> request(
      {num pageSize, num pageNumber = 0, num startTimestamp = 0}) async {
    final params = {
      Param.pageSize: pageSize,
      Param.pageNumber: pageNumber,
      Param.startTimestamp: startTimestamp
    };

    return await Network().post(address: Address.activity, params: params);
  }
}
