import 'package:semantic_theme/index.dart';

abstract class ThemeOptionDependent {
  final ThemeOption currentThemeOption;
  ThemeOptionDependent(this.currentThemeOption);
}
