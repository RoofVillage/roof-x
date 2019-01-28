import 'typography_style.dart';
import 'utils/index.dart';

class RoofBody2Ios extends _RoofBody2 {}

class RoofBody2Android extends _RoofBody2 {}

class _RoofBody2 extends RoofTypographyStyle {
  static const _fontSize = RoofFontSize.small;
  static const _fontWeight = RoofFontWeight.thin;
  static const double _leading = _fontSize;
  static const double _tracking = 0;

  _RoofBody2(
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
