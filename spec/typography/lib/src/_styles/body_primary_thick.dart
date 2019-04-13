import 'typography_style.dart';
import '_utils/font_size.dart' as font_size;
import '_utils/font_weight.dart' as font_weight;

class RoofBodyPrimaryThickIos with _RoofBodyPrimaryThick, TypographyStyle {}

class RoofBodyPrimaryThickAndroid with _RoofBodyPrimaryThick, TypographyStyle {}

mixin _RoofBodyPrimaryThick implements TypographyStyle {
  @override
  final fontSize = font_size.medium;

  @override
  final fontWeight = font_weight.thick;

  @override
  final leading = font_size.medium;

  @override
  final tracking = 0;
}
