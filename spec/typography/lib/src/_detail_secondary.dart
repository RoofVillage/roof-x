import '_typography_style.dart';

import 'utils/index.dart';

class RoofDetailSecondaryIos with _DetailSecondary, TypographyStyle {}

class RoofDetailSecondaryAndroid with _DetailSecondary, TypographyStyle {}

mixin _DetailSecondary implements TypographyStyle {
  @override
  final fontSize = RoofFontSize.extraSmall;
  @override
  final fontWeight = RoofFontWeight.medium;
  @override
  final leading = RoofFontSize.extraSmall;
  @override
  final tracking = 0;
}
