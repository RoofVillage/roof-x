import 'typography_style.dart';
import 'utils/index.dart';

class RoofBodyPrimaryThickIos extends _RoofBodyPrimaryThick {}

class RoofBodyPrimaryThickAndroid extends _RoofBodyPrimaryThick {}

class _RoofBodyPrimaryThick extends RoofTypographyStyle {
  static const _fontSize = RoofFontSize.medium;
  static const _fontWeight = RoofFontWeight.thick;
  static const double _leading = _fontSize;
  static const double _tracking = 0;

  _RoofBodyPrimaryThick(
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
