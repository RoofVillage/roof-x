import 'package:semantic_theme/src/_utils/theme_option_dependent.dart';

mixin ValueForThemeOption<V, T> on ThemeOptionDependent<T> {
  V forThemeOption(Map<T, V> map) {
    return map[currentThemeOption];
  }
}
