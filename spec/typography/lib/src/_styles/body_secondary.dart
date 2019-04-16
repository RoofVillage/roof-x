import 'typography_style.dart';

import '_utils/font_size.dart' as font_size;
import '_utils/font_weight.dart' as font_weight;

class RoofBodySecondaryIos with _RoofBodySecondary, TypographyStyle {}

class RoofBodySecondaryAndroid with _RoofBodySecondary, TypographyStyle {}

mixin _RoofBodySecondary implements TypographyStyle {
  @override
  final fontSize = font_size.small;
  @override
  final fontWeight = font_weight.thin;
  @override
  final leading = font_size.small;
  @override
  final tracking = 0;
}
