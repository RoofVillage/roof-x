import 'package:semantic_theme/index.dart';

abstract class SemanticTypographyLibrary {
  /// Header for high-level pages.
  SemanticTypography get headingPrimary;

  /// Header for main section or modal.
  SemanticTypography get headingSecondary;

  /// Title for forms, cards, or subsections.
  SemanticTypography get title;

  /// Subtitle for forms, cards, or subsections.
  SemanticTypography get subtitle;

  /// Label for input fields and controls.
  SemanticTypography get label;

  /// General body typography.
  SemanticTypography get body;

  /// Heavy body typography.
  SemanticTypography get bodyHeavy;

  /// Typography for buttons.
  SemanticTypography get button;

  /// Typography for captions, tooltips, and small helper text.
  SemanticTypography get detail;

  /// Heavy typography for captions, tooltips, and small helper text.
  SemanticTypography get detailHeavy;
}
