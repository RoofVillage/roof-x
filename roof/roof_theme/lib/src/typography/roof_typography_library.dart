import 'package:semantic_theme/index.dart';
import 'package:roof_theme/src/typography/_body.dart';
import 'package:roof_theme/src/typography/_body_heavy.dart';
import 'package:roof_theme/src/typography/_button.dart';
import 'package:roof_theme/src/typography/_detail.dart';
import 'package:roof_theme/src/typography/_detail_heavy.dart';
import 'package:roof_theme/src/typography/_heading_primary.dart';
import 'package:roof_theme/src/typography/_heading_secondary.dart';
import 'package:roof_theme/src/typography/_label.dart';
import 'package:roof_theme/src/typography/_subtitle.dart';
import 'package:roof_theme/src/typography/_title.dart';

class RoofTypographyLibrary extends SemanticTypographyLibrary {
  RoofTypographyLibrary(currentThemeOption) : super(currentThemeOption);

  @override
  SemanticTypography get headingPrimary =>
      RoofHeadingPrimaryTypography(currentThemeOption);

  @override
  SemanticTypography get headingSecondary =>
      RoofHeadingSecondaryTypography(currentThemeOption);

  @override
  SemanticTypography get body => RoofBodyTypography(currentThemeOption);

  @override
  SemanticTypography get bodyHeavy =>
      RoofBodyHeavyTypography(currentThemeOption);

  @override
  SemanticTypography get detail => RoofDetailTypography(currentThemeOption);

  @override
  SemanticTypography get detailHeavy =>
      RoofDetailHeavyTypography(currentThemeOption);

  @override
  SemanticTypography get label => RoofLabelTypography(currentThemeOption);

  @override
  SemanticTypography get title => RoofTitleTypography(currentThemeOption);

  @override
  SemanticTypography get subtitle => RoofSubtitleTypography(currentThemeOption);

  @override
  SemanticTypography get button => RoofButtonTypography(currentThemeOption);
}
