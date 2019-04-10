import '_typography_style.dart';

import 'utils/index.dart';

class RoofTitleIos with _RoofTitle1, TypographyStyle {}

class RoofTitleAndroid with _RoofTitle1, TypographyStyle {}

mixin _RoofTitle1 implements TypographyStyle {
  final fontSize = RoofFontSize.small;
  final fontWeight = RoofFontWeight.medium;
  final leading = RoofFontSize.small;
  final tracking = 0;
}
