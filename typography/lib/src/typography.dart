import 'dart:io' show Platform;

import '_detail_primary.dart';
import '_detail_secondary.dart';
import '_body_primary.dart';
import '_body_primary_thick.dart';
import '_body_secondary.dart';
import '_button.dart';
import '_heading_1.dart';
import '_heading_2.dart';
import '_title.dart';
import 'typography_style.dart';

class RoofTypography {
  static RoofTypographyStyle get detailPrimary {
    if (Platform.isIOS)
      return RoofDetailPrimaryIos();
    else
      return RoofDetailPrimaryAndroid();
  }

  static RoofTypographyStyle get detailSecondary {
    if (Platform.isIOS)
      return RoofDetailSecondaryIos();
    else
      return RoofDetailSecondaryAndroid();
  }

  static RoofTypographyStyle get title {
    if (Platform.isIOS)
      return RoofTitleIos();
    else
      return RoofTitleAndroid();
  }

  static RoofTypographyStyle get bodySecondary {
    if (Platform.isIOS)
      return RoofBodySecondaryIos();
    else
      return RoofBodySecondaryAndroid();
  }

  static RoofTypographyStyle get bodyPrimary {
    if (Platform.isIOS)
      return RoofBodyPrimaryIos();
    else
      return RoofBodyPrimaryAndroid();
  }

  static RoofTypographyStyle get bodyPrimaryThick {
    if (Platform.isIOS)
      return RoofBodyPrimaryThickIos();
    else
      return RoofBodyPrimaryThickAndroid();
  }

  static RoofTypographyStyle get heading2 {
    if (Platform.isIOS)
      return RoofHeading2Ios();
    else
      return RoofHeading2Android();
  }

  static RoofTypographyStyle get heading1 {
    if (Platform.isIOS)
      return RoofHeading1Ios();
    else
      return RoofHeading1Android();
  }

  static RoofTypographyStyle get button {
    if (Platform.isIOS)
      return RoofButtonIos();
    else
      return RoofButtonAndroid();
  }
}
