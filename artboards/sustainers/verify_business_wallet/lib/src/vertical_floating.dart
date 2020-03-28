import 'package:form_vertical_floating_artboard_template/index.dart';
import 'package:verify_business_wallet_artboard/src/_data.dart';

class VerifyBusinessWalletVerticalFloatingArtboard
    extends FormVerticalFloatingArtboard with VerifyBusinessWalletArtboardData {
  @override
  String get title => "Verify your wallet";

  @override
  String get subtitle =>
      "Provide some information so we can verify your identity.";

  @override
  String get submitButtonText => 'Submit';
}
