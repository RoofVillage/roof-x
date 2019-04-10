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
import '_typography_style.dart';

TypographyStyle get detailPrimary {
  if (Platform.isIOS) {
    return RoofDetailPrimaryIos();
  } else {
    return RoofDetailPrimaryAndroid();
  }
}

TypographyStyle get detailSecondary {
  if (Platform.isIOS) {
    return RoofDetailSecondaryIos();
  } else {
    return RoofDetailSecondaryAndroid();
  }
}

TypographyStyle get title {
  if (Platform.isIOS) {
    return RoofTitleIos();
  } else {
    return RoofTitleAndroid();
  }
}

TypographyStyle get bodySecondary {
  if (Platform.isIOS) {
    return RoofBodySecondaryIos();
  } else {
    return RoofBodySecondaryAndroid();
  }
}

TypographyStyle get bodyPrimary {
  if (Platform.isIOS) {
    return RoofBodyPrimaryIos();
  } else {
    return RoofBodyPrimaryAndroid();
  }
}

TypographyStyle get bodyPrimaryThick {
  if (Platform.isIOS) {
    return RoofBodyPrimaryThickIos();
  } else {
    return RoofBodyPrimaryThickAndroid();
  }
}

TypographyStyle get heading2 {
  if (Platform.isIOS) {
    return RoofHeading2Ios();
  } else {
    return RoofHeading2Android();
  }
}

TypographyStyle get heading1 {
  if (Platform.isIOS) {
    return RoofHeading1Ios();
  } else {
    return RoofHeading1Android();
  }
}

TypographyStyle get button {
  if (Platform.isIOS) {
    return RoofButtonIos();
  } else {
    return RoofButtonAndroid();
  }
}
