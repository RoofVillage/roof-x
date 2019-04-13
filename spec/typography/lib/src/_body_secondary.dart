import '_typography_style.dart';

import 'utils/index.dart';

class RoofBodySecondaryIos with _RoofBodySecondary, TypographyStyle {}

class RoofBodySecondaryAndroid with _RoofBodySecondary, TypographyStyle {}

mixin _RoofBodySecondary implements TypographyStyle {
  @override
  final fontSize = RoofFontSize.small;
  @override
  final fontWeight = RoofFontWeight.thin;
  @override
  final leading = RoofFontSize.small;
  @override
  final tracking = 0;
}
