import 'typography_style.dart';

import '_utils/font_size.dart' as font_size;
import '_utils/font_weight.dart' as font_weight;

class RoofHeading1Ios with _RoofHeading1, TypographyStyle {}

class RoofHeading1Android with _RoofHeading1, TypographyStyle {}

mixin _RoofHeading1 implements TypographyStyle {
  @override
  final fontSize = font_size.extraLarge;
  @override
  final fontWeight = font_weight.thin;
  @override
  final leading = font_size.extraLarge;
  @override
  final tracking = 0;
}
