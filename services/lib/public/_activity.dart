import 'package:services/utils/network.dart';
import 'package:services/utils/static_key.dart';
import 'package:services/utils/service_address.dart';

class PublicActivity {
  Future request(
      {num pageSize, num pageNumber = 0, num startTimestamp = 0}) async {
    final body = {
      StaticKey.pageSize: pageSize,
      StaticKey.pageNumber: pageNumber,
      StaticKey.startTimestamp: startTimestamp
    };

    return await Network().post(url: ServiceAddress.activity, body: body);
  }
}
