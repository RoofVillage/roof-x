import 'typography_style.dart';
import 'utils/index.dart';

class RoofDetailSecondaryIos extends _DetailSecondary {}

class RoofDetailSecondaryAndroid extends _DetailSecondary {}

class _DetailSecondary extends RoofTypographyStyle {
  static const _fontSize = RoofFontSize.extraSmall;
  static const _fontWeight = RoofFontWeight.medium;
  static const double _leading = _fontSize;
  static const double _tracking = 0;

  _DetailSecondary(
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
