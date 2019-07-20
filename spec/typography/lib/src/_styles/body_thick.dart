import 'typography_style.dart';
import '_utils/font_size.dart' as font_size;
import '_utils/font_weight.dart' as font_weight;

class RoofBodyThickIos with _RoofBodyThick, TypographyStyle {}

class RoofBodyThickAndroid with _RoofBodyThick, TypographyStyle {}

mixin _RoofBodyThick implements TypographyStyle {
  @override
  final fontSize = font_size.small;

  @override
  final fontWeight = font_weight.thick;

  @override
  final leading = font_size.small;

  @override
  final tracking = 0;
}
