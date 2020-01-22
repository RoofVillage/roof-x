import 'package:semantic_theme/index.dart';
import 'package:semantic_theme/src/_utils/theme_option_aware.dart';
import 'package:semantic_theme/src/color/colors/background.dart';
import 'package:semantic_theme/src/color/colors/icon.dart';
import 'package:semantic_theme/src/color/colors/stroke.dart';

abstract class ColorLibrary implements ThemeOptionDependent {
  SemanticBackgroundColor get background;
  SemanticStrokeColor get stroke;
  SemanticIconColor get icon;
  SemanticTextColor get text;
}
