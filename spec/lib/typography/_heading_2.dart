import '_typography_style.dart';
import 'utils/index.dart';

class RoofHeading2Ios extends _RoofHeading2 {}

class RoofHeading2Android extends _RoofHeading2 {}

class _RoofHeading2 extends RoofTypographyStyle {
  static const _fontSize = RoofFontSize.large;
  static const _fontWeight = RoofFontWeight.thick;
  static const double _leading = _fontSize;
  static const double _tracking = 0;

  _RoofHeading2(
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
