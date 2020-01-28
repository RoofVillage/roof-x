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
  @override
  SemanticTypography get headingPrimary => SmHeadingPrimaryTypography();

  @override
  SemanticTypography get headingSecondary => SmHeadingSecondaryTypography();

  @override
  SemanticTypography get body => SmBodyTypography();

  @override
  SemanticTypography get bodyHeavy => SmBodyHeavyTypography();

  @override
  SemanticTypography get detail => SmDetailTypography();

  @override
  SemanticTypography get detailHeavy => SmDetailHeavyTypography();

  @override
  SemanticTypography get label => SmLabelTypography();

  @override
  SemanticTypography get title => SmTitleTypography();

  @override
  SemanticTypography get subtitle => SmSubtitleTypography();

  @override
  SemanticTypography get button => SmButtonTypography();
}
