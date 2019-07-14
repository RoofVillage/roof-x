import 'typography_style.dart';

import '_utils/font_size.dart' as font_size;
import '_utils/font_weight.dart' as font_weight;

class RoofTitleIos with _RoofTitle1, TypographyStyle {}

class RoofTitleAndroid with _RoofTitle1, TypographyStyle {}

mixin _RoofTitle1 implements TypographyStyle {
  final fontSize = font_size.extraSmall;
  final fontWeight = font_weight.medium;
  final leading = font_size.extraSmall;
  final tracking = 0;
}
