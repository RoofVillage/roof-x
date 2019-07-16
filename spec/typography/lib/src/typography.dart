import 'dart:io' show Platform;

import '_styles/detail_primary.dart';
import '_styles/detail_secondary.dart';
import '_styles/body.dart';
import '_styles/body_thick.dart';
import '_styles/button.dart';
import '_styles/heading_1.dart';
import '_styles/heading_2.dart';
import '_styles/title.dart';
import '_styles/typography_style.dart';

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

TypographyStyle get body {
  if (Platform.isIOS) {
    return RoofBodyIos();
  } else {
    return RoofBodyAndroid();
  }
}

TypographyStyle get bodyThick {
  if (Platform.isIOS) {
    return RoofBodyThickIos();
  } else {
    return RoofBodyThickAndroid();
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
