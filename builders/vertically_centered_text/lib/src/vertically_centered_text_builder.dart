import 'package:flutter/widgets.dart';

import '_components/vertically_centered_text.dart';

mixin VerticallyCenteredTextBuilder {
  Widget buildVerticallyCenteredText(Text text) => VerticallyCenteredText(text);
}
