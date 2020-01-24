import 'package:semantic_theme/index.dart';
import 'package:theme/src/typography/_body.dart';
import 'package:theme/src/typography/_body_heavy.dart';
import 'package:theme/src/typography/_detail.dart';
import 'package:theme/src/typography/_detail_heavy.dart';
import 'package:theme/src/typography/_heading_primary.dart';
import 'package:theme/src/typography/_heading_secondary.dart';
import 'package:theme/src/typography/_label.dart';
import 'package:theme/src/typography/_subtitle.dart';
import 'package:theme/src/typography/_title.dart';

class RoofTypographyLibrary extends SemanticTypographyLibrary {
  @override
  SemanticTypography get headingPrimary => RoofHeadingPrimaryTypography();

  @override
  SemanticTypography get headingSecondary => RoofHeadingSecondaryTypography();

  @override
  SemanticTypography get body => RoofBodyTypography();

  @override
  SemanticTypography get bodyHeavy => RoofBodyHeavyTypography();

  @override
  SemanticTypography get detail => RoofDetailTypography();

  @override
  SemanticTypography get detailHeavy => RoofDetailHeavyTypography();

  @override
  SemanticTypography get label => RoofLabelTypography();

  @override
  SemanticTypography get title => RoofTitleTypography();

  @override
  SemanticTypography get subtitle => RoofSubtitleTypography();
}