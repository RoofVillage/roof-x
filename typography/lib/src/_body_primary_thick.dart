import '_typography_style.dart';
import 'utils/index.dart';

class RoofBodyPrimaryThickIos with _RoofBodyPrimaryThick, TypographyStyle {}

class RoofBodyPrimaryThickAndroid with _RoofBodyPrimaryThick, TypographyStyle {}

mixin _RoofBodyPrimaryThick implements TypographyStyle {
  @override
  final fontSize = RoofFontSize.medium;

  @override
  final fontWeight = RoofFontWeight.thick;

  @override
  final leading = RoofFontSize.medium;

  @override
  final tracking = 0;
}
