import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:semantic_theme/src/color/color_library.dart';
import 'package:semantic_theme/src/curve/curve_library.dart';
import 'package:semantic_theme/src/distance/distance_library.dart';
import 'package:semantic_theme/src/duration/duration_library.dart';
import 'package:semantic_theme/src/radius/radius_library.dart';
import 'package:semantic_theme/src/shadow/shadow_library.dart';
import 'package:semantic_theme/src/typography/typography_library.dart';

import 'option.dart';

abstract class SemanticTheme extends StatefulWidget {
  final Widget child;
  final ThemeOption themeOption;

  SemanticTheme(
    this.themeOption, {
    @required this.child,
  });

  @override
  SemanticInheritedTheme createState();

  static SemanticInheritedTheme of(
    BuildContext context, {
    bool shouldRebuild = true,
  }) {
    final inheritedWidget = shouldRebuild
        ? context.dependOnInheritedWidgetOfExactType<_SemanticInheritedTheme>()
        : context.findAncestorWidgetOfExactType<_SemanticInheritedTheme>();

    return inheritedWidget.data;
  }
}

abstract class SemanticInheritedTheme extends State<SemanticTheme> {
  ThemeOption currentThemeOption;

  ColorLibrary get colors;
  CurveLibrary get curves;
  DistanceLibrary get distances;
  DurationLibrary get durations;
  RadiusLibrary get radiuses;
  ShadowLibrary get shadows;
  TypographyLibrary get typography;

  SystemUiOverlayStyle get systemChromeStyle {
    switch (currentThemeOption) {
      case ThemeOption.light:
        return SystemUiOverlayStyle.dark;
      case ThemeOption.dark:
        return SystemUiOverlayStyle.light;
    }
    return null;
  }

  @override
  void initState() {
    currentThemeOption = widget.themeOption;
    super.initState();
  }

  void use(ThemeOption theme) => setState(() => currentThemeOption = theme);

  @override
  Widget build(BuildContext context) {
    return _SemanticInheritedTheme(
      data: this,
      child: widget.child,
    );
  }
}

class _SemanticInheritedTheme extends InheritedWidget {
  final SemanticInheritedTheme data;

  _SemanticInheritedTheme({
    @required this.data,
    @required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(_SemanticInheritedTheme old) => true;
}
