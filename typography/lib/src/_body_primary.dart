import '_typography_style.dart';
import 'utils/index.dart';

class RoofBodyPrimaryIos with _RoofBodyPrimary, TypographyStyle {}

class RoofBodyPrimaryAndroid with _RoofBodyPrimary, TypographyStyle {}

mixin _RoofBodyPrimary implements TypographyStyle {
  @override
  final fontSize = RoofFontSize.medium;
  @override
  final fontWeight = RoofFontWeight.thin;
  @override
  final leading = RoofFontSize.medium;
  @override
  final tracking = 0;
}
