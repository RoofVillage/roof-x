import 'package:form_vertical_floating_artboard_template/index.dart';

import '_data.dart';

class AuthVerifyCodeVerticalFloatingArtboard
    extends FormVerticalFloatingArtboard with AuthVerifyCodeArtboardData {
  final String phoneNumber;

  AuthVerifyCodeVerticalFloatingArtboard({this.phoneNumber});

  @override
  String get title => "Enter the code sent to ${phoneNumber ?? 'your phone'}";
}
