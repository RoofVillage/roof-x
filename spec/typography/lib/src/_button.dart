import '_typography_style.dart';

import 'utils/index.dart';

class RoofButtonIos with _RoofButton, TypographyStyle {}

class RoofButtonAndroid with _RoofButton, TypographyStyle {}

mixin _RoofButton implements TypographyStyle {
  @override
  final fontSize = RoofFontSize.small;
  @override
  final fontWeight = RoofFontWeight.thick;
  @override
  final leading = RoofFontSize.small;
  @override
  final tracking = 0;
}
