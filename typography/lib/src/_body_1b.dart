import 'typography_style.dart';
import 'utils/index.dart';

class RoofBody1bIos extends _RoofBody1b {}

class RoofBody1bAndroid extends _RoofBody1b {}

class _RoofBody1b extends RoofTypographyStyle {
  static const _fontSize = RoofFontSize.extraSmall;
  static const _fontWeight = RoofFontWeight.thin;
  static const double _leading = _fontSize;
  static const double _tracking = 0;

  _RoofBody1b(
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
