import 'typography_style.dart';
import 'utils/index.dart';

class RoofBodySecondaryIos extends _RoofBodySecondary {}

class RoofBodySecondaryAndroid extends _RoofBodySecondary {}

class _RoofBodySecondary extends RoofTypographyStyle {
  static const _fontSize = RoofFontSize.small;
  static const _fontWeight = RoofFontWeight.thin;
  static const double _leading = _fontSize;
  static const double _tracking = 0;

  _RoofBodySecondary(
      {fontSize = _fontSize,
      fontWeight = _fontWeight,
      leading = _leading,
      tracking = _tracking})
      : super(
            fontSize: fontSize,
            fontWeight: fontWeight,
            leading: leading,
            tracking: tracking);
}
