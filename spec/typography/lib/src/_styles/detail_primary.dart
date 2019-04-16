import 'typography_style.dart';

import '_utils/font_size.dart' as font_size;
import '_utils/font_weight.dart' as font_weight;

class RoofDetailPrimaryIos with _DetailPrimary, TypographyStyle {}

class RoofDetailPrimaryAndroid with _DetailPrimary, TypographyStyle {}

mixin _DetailPrimary implements TypographyStyle {
  @override
  final fontSize = font_size.extraSmall;
  @override
  final fontWeight = font_weight.thick;
  @override
  final leading = font_size.extraSmall;
  @override
  final tracking = 0;
}
