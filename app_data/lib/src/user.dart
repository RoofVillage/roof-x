import 'package:service/index.dart';

import 'utils/index.dart';

class User {
  Future<String> create({String name, String email, String password}) async {
    final params = {
      Param.firstName: name,
      Param.lastName: name,
      Param.email: email,
      Param.password: password
    };

    return await Api().post(service: Service.signUp, params: params);
  }
}
