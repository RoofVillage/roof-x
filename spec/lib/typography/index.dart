import 'dart:io' show Platform;

import '_body_1a.dart';
import '_body_1b.dart';
import '_body_2.dart';
import '_button.dart';
import '_heading_1.dart';
import '_title_1.dart';
import '_typography_style.dart';

export '_typography_style.dart';

class RoofTypography {
  static RoofTypographyStyle get body1a {
    if (Platform.isIOS)
      return RoofBody1aIos();
    else
      return RoofBody1aAndroid();
  }

  static RoofTypographyStyle get body1b {
    if (Platform.isIOS)
      return RoofBody1bIos();
    else
      return RoofBody1bAndroid();
  }

  static RoofTypographyStyle get body2 {
    if (Platform.isIOS)
      return RoofBody2Ios();
    else
      return RoofBody2Android();
  }

  static RoofTypographyStyle get button {
    if (Platform.isIOS)
      return RoofButtonIos();
    else
      return RoofSubmitButtonndroid();
  }

  static RoofTypographyStyle get title1 {
    if (Platform.isIOS)
      return RoofTitle1Ios();
    else
      return RoofTitle1Android();
  }

  static RoofTypographyStyle get heading1 {
    if (Platform.isIOS)
      return RoofHeading1Ios();
    else
      return RoofHeading1Android();
  }
}
