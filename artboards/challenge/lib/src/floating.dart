import 'package:floating_artboard_templates/index.dart';

import '_builder.dart';

class ChallengeFloatingArtboard extends FormFloatingArtboard
    with ChallengeArtboardBuilder {
  final String phoneNumber;
  ChallengeFloatingArtboard({this.phoneNumber});
}
