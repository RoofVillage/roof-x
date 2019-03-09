import 'typography_style.dart';
import 'utils/index.dart';

class RoofBodyPrimaryIos extends _RoofBodyPrimary {}

class RoofBodyPrimaryAndroid extends _RoofBodyPrimary {}

class _RoofBodyPrimary extends RoofTypographyStyle {
  static const _fontSize = RoofFontSize.medium;
  static const _fontWeight = RoofFontWeight.thin;
  static const double _leading = _fontSize;
  static const double _tracking = 0;

  _RoofBodyPrimary(
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
