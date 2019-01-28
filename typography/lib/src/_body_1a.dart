import 'typography_style.dart';
import 'utils/index.dart';

class RoofBody1aIos extends _RoofBody1a {}

class RoofBody1aAndroid extends _RoofBody1a {}

class _RoofBody1a extends RoofTypographyStyle {
  static const _fontSize = RoofFontSize.extraSmall;
  static const _fontWeight = RoofFontWeight.thick;
  static const double _leading = _fontSize;
  static const double _tracking = 0;

  _RoofBody1a(
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
