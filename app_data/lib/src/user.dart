import 'dart:async';

import 'package:meta/meta.dart';
import 'package:network/index.dart';

import 'utils/index.dart';
import '_param.dart' as _param;

class User {
  Future<PostResponse> create(
      {@required String name,
      @required String email,
      @required String phoneNumber,
      @required String password}) async {
    //validate
    final params = {
      _param.firstName: name,
      _param.lastName: name,
      _param.email: email,
      _param.phoneNumber: phoneNumber,
      _param.password: password
    };

    return await post(service: Service.signUp, params: params);
  }
}
