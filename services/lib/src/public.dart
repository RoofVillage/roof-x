import 'utils/index.dart';

class GetPublicActivity {
  Future<String> request(
      {num pageSize, num pageNumber = 0, num startTimestamp = 0}) async {
    final body = {
      StaticKey.pageSize: pageSize,
      StaticKey.pageNumber: pageNumber,
      StaticKey.startTimestamp: startTimestamp
    };

    return await Network().post(url: ServiceAddress.activity, body: body);
  }
}
