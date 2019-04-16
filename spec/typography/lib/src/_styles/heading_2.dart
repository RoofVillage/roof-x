import 'typography_style.dart';

import '_utils/font_size.dart' as font_size;
import '_utils/font_weight.dart' as font_weight;

class RoofHeading2Ios with _RoofHeading2, TypographyStyle {}

class RoofHeading2Android with _RoofHeading2, TypographyStyle {}

mixin _RoofHeading2 implements TypographyStyle {
  @override
  final fontSize = font_size.large;
  @override
  final fontWeight = font_weight.thick;
  @override
  final leading = font_size.large;
  @override
  final tracking = 0;
}
