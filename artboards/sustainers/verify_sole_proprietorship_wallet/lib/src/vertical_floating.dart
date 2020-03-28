import 'package:form_vertical_floating_artboard_template/index.dart';

import './_data.dart';

class VerifySoleProprietorshipWalletVerticalFloatingArtboard
    extends FormVerticalFloatingArtboard
    with VerifySoleProprietorshipWalletArtboardData {
  @override
  String get title => "Verify your wallet";

  @override
  String get subtitle =>
      "Provide some information so we can verify your identity.";

  @override
  String get submitButtonText => 'Submit';
}
