import 'package:roof/util/network_controller.dart';
import 'package:roof/util/static_key.dart';
import 'package:roof/util/service_address.dart';

class Activity {
  Future request(
      {num pageSize, num pageNumber = 0, num startTimestamp = 0}) async {
    final body = {
      StaticKey.pageSize: pageSize,
      StaticKey.pageNumber: pageNumber,
      StaticKey.startTimestamp: startTimestamp
    };

    return await NetworkController()
        .post(url: ServiceAddress.activity, body: body);
  }
}
