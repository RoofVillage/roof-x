import 'typography_style.dart';
import 'utils/index.dart';

class RoofDetailPrimaryIos extends _DetailPrimary {}

class RoofDetailPrimaryAndroid extends _DetailPrimary {}

class _DetailPrimary extends RoofTypographyStyle {
  static const _fontSize = RoofFontSize.extraSmall;
  static const _fontWeight = RoofFontWeight.thick;
  static const double _leading = _fontSize;
  static const double _tracking = 0;

  _DetailPrimary(
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
