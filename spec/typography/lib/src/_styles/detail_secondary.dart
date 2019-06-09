import 'typography_style.dart';

import '_utils/font_size.dart' as font_size;
import '_utils/font_weight.dart' as font_weight;

class RoofDetailSecondaryIos with _DetailSecondary, TypographyStyle {}

class RoofDetailSecondaryAndroid with _DetailSecondary, TypographyStyle {}

mixin _DetailSecondary implements TypographyStyle {
  @override
  final fontSize = font_size.extraSmall;
  @override
  final fontWeight = font_weight.thin;
  @override
  final leading = font_size.extraSmall;
  @override
  final tracking = 0;
}
