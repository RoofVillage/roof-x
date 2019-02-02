import 'package:network/index.dart';
import 'utils/index.dart';

// import 'param.dart';

class SignUp {
  Future<String> request({String name, String email}) {
    final params = {
      // Param.pageSize: pageSize,
      // Param.pageNumber: pageNumber,
      // Param.startTimestamp: startTimestamp
    };

    return Network().post(address: ServiceAddress.activity, params: params);
  }
}
