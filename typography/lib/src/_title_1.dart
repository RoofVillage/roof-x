import 'typography_style.dart';
import 'utils/index.dart';

class RoofTitle1Ios extends _RoofTitle1 {}

class RoofTitle1Android extends _RoofTitle1 {}

class _RoofTitle1 extends RoofTypographyStyle {
  static const _fontSize = RoofFontSize.small;
  static const _fontWeight = RoofFontWeight.thin;
  static const double _leading = _fontSize;
  static const double _tracking = 0;

  _RoofTitle1(
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
