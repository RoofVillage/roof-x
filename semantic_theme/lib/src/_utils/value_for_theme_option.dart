import 'package:semantic_theme/src/_utils/theme_option_dependent.dart';

mixin ValueForThemeOption<ThemeOption> on ThemeOptionDependent<ThemeOption> {
  T forThemeOption<T>(Map<ThemeOption, T> map) {
    return map[currentThemeOption];
  }
}
