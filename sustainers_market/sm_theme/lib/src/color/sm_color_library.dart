import 'package:semantic_theme/index.dart';
import 'package:sm_theme/src/sm_theme_option.dart';

import '_semantic_colors/index.dart';

class SmColorLibrary extends SemanticColorLibrary<SmThemeOption> {
  SmColorLibrary(SmThemeOption currentThemeOption)
      : super(currentThemeOption);

  @override
  SemanticBackgroundColor<SmThemeOption> get background =>
      SmBackgroundColor(currentThemeOption);

  @override
  SemanticIconColor<SmThemeOption> get icon =>
      SmIconColor(currentThemeOption);

  @override
  SemanticStrokeColor<SmThemeOption> get stroke =>
      SmStrokeColor(currentThemeOption);

  @override
  SemanticTextColor<SmThemeOption> get text =>
      SmTextColor(currentThemeOption);
}
