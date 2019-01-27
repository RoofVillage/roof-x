import '_typography_style.dart';
import 'utils/index.dart';

class RoofHeading1Ios extends _RoofHeading1 {}

class RoofHeading1Android extends _RoofHeading1 {}

class _RoofHeading1 extends RoofTypographyStyle {
  static const _fontSize = RoofFontSize.large;
  static const _fontWeight = RoofFontWeight.thin;
  static const double _leading = 18;
  static const double _tracking = 10;

  _RoofHeading1(
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
