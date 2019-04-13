import '_typography_style.dart';

import 'utils/index.dart';

class RoofDetailPrimaryIos with _DetailPrimary, TypographyStyle {}

class RoofDetailPrimaryAndroid with _DetailPrimary, TypographyStyle {}

mixin _DetailPrimary implements TypographyStyle {
  @override
  final fontSize = RoofFontSize.extraSmall;
  @override
  final fontWeight = RoofFontWeight.thick;
  @override
  final leading = RoofFontSize.extraSmall;
  @override
  final tracking = 0;
}
