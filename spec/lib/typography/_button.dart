import '_typography_style.dart';
import 'utils/index.dart';

class RoofButtonIos extends _RoofButton {}

class RoofSubmitButtonndroid extends _RoofButton {}

class _RoofButton extends RoofTypographyStyle {
  static const _fontSize = RoofFontSize.small;
  static const _fontWeight = RoofFontWeight.thick;
  static const double _leading = _fontSize;
  static const double _tracking = 0;

  _RoofButton(
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
