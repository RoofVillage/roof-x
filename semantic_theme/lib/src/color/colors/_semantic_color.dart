import '../../_utils/theme_option_dependent.dart';
import '../../_utils/value_for_theme_option.dart';

abstract class SemanticColor<T> extends ThemeOptionDependent<T>
    with ValueForThemeOption<T> {
  SemanticColor(T currentThemeOption) : super(currentThemeOption);
}
