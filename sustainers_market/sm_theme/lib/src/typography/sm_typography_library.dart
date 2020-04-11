import 'package:semantic_theme/index.dart';
import 'package:sm_theme/src/typography/_body.dart';
import 'package:sm_theme/src/typography/_body_heavy.dart';
import 'package:sm_theme/src/typography/_button.dart';
import 'package:sm_theme/src/typography/_detail.dart';
import 'package:sm_theme/src/typography/_detail_heavy.dart';
import 'package:sm_theme/src/typography/_heading_primary.dart';
import 'package:sm_theme/src/typography/_heading_secondary.dart';
import 'package:sm_theme/src/typography/_label.dart';
import 'package:sm_theme/src/typography/_subtitle.dart';
import 'package:sm_theme/src/typography/_title.dart';

class SmTypographyLibrary extends SemanticTypographyLibrary {
  SmTypographyLibrary(currentThemeOption) : super(currentThemeOption);

  @override
  SemanticTypography get headingPrimary =>
      SmHeadingPrimaryTypography(currentThemeOption);

  @override
  SemanticTypography get headingSecondary =>
      SmHeadingSecondaryTypography(currentThemeOption);

  @override
  SemanticTypography get body => SmBodyTypography(currentThemeOption);

  @override
  SemanticTypography get bodyHeavy => SmBodyHeavyTypography(currentThemeOption);

  @override
  SemanticTypography get detail => SmDetailTypography(currentThemeOption);

  @override
  SemanticTypography get detailHeavy =>
      SmDetailHeavyTypography(currentThemeOption);

  @override
  SemanticTypography get label => SmLabelTypography(currentThemeOption);

  @override
  SemanticTypography get title => SmTitleTypography(currentThemeOption);

  @override
  SemanticTypography get subtitle => SmSubtitleTypography(currentThemeOption);

  @override
  SemanticTypography get button => SmButtonTypography(currentThemeOption);
}
