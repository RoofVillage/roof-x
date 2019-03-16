import 'package:meta/meta.dart';
import 'package:service/index.dart';

import 'utils/index.dart';

class User {
  Future<String> create(
      {@required String name,
      @required String email,
      @required String phoneNumber,
      @required String password}) async {
    //validate
    final params = {
      Param.firstName: name,
      Param.lastName: name,
      Param.email: email,
      Param.phoneNumber: phoneNumber,
      Param.password: password
    };

    return await Api().post(service: Service.signUp, params: params);
  }
}
