import '_typography_style.dart';

import 'utils/index.dart';

class RoofHeading1Ios with _RoofHeading1, TypographyStyle {}

class RoofHeading1Android with _RoofHeading1, TypographyStyle {}

mixin _RoofHeading1 implements TypographyStyle {
  @override
  final fontSize = RoofFontSize.extraLarge;
  @override
  final fontWeight = RoofFontWeight.thin;
  @override
  final leading = RoofFontSize.extraLarge;
  @override
  final tracking = 0;
}
