import 'typography_style.dart';
import '_utils/font_size.dart' as font_size;
import '_utils/font_weight.dart' as font_weight;

class RoofBodyPrimaryIos with _RoofBodyPrimary, TypographyStyle {}

class RoofBodyPrimaryAndroid with _RoofBodyPrimary, TypographyStyle {}

mixin _RoofBodyPrimary implements TypographyStyle {
  @override
  final fontSize = font_size.medium;
  @override
  final fontWeight = font_weight.thin;
  @override
  final leading = font_size.medium;
  @override
  final tracking = 0;
}
