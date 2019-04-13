import '_typography_style.dart';

import 'utils/index.dart';

class RoofHeading2Ios with _RoofHeading2, TypographyStyle {}

class RoofHeading2Android with _RoofHeading2, TypographyStyle {}

mixin _RoofHeading2 implements TypographyStyle {
  @override
  final fontSize = RoofFontSize.large;
  @override
  final fontWeight = RoofFontWeight.thick;
  @override
  final leading = RoofFontSize.large;
  @override
  final tracking = 0;
}
