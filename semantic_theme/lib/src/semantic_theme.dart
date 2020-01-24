import 'package:flutter/material.dart';
import 'package:semantic_theme/src/color/index.dart';
import 'package:semantic_theme/src/curve/index.dart';
import 'package:semantic_theme/src/distance/index.dart';
import 'package:semantic_theme/src/duration/index.dart';
import 'package:semantic_theme/src/radius/index.dart';
import 'package:semantic_theme/src/shadow/index.dart';
import 'package:semantic_theme/src/typography/index.dart';
import 'package:semantic_theme/src/system_ui_overlay_style/index.dart';

abstract class SemanticTheme<T> extends StatefulWidget {
  final Widget child;
  final T themeOption;

  SemanticTheme(
    this.themeOption, {
    @required this.child,
  });

  @override
  SemanticInheritedTheme<T> createState();

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

abstract class SemanticInheritedTheme<T> extends State<SemanticTheme<T>> {
  T currentThemeOption;

  ColorLibrary get colors;
  CurveLibrary get curves;
  DistanceLibrary get distances;
  DurationLibrary get durations;
  RadiusLibrary get radiuses;
  ShadowLibrary get shadows;
  TypographyLibrary get typography;
  SemanticSystemUiOverlayStyle get uiOverlayStyle;

  @override
  void initState() {
    currentThemeOption = widget.themeOption;
    super.initState();
  }

  void use(T theme) => setState(() => currentThemeOption = theme);

  @override
  Widget build(BuildContext context) {
    return _SemanticInheritedTheme(
      data: this,
      child: widget.child,
    );
  }
}

class _SemanticInheritedTheme<T> extends InheritedWidget {
  final SemanticInheritedTheme<T> data;

  _SemanticInheritedTheme({
    @required this.data,
    @required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(_SemanticInheritedTheme<T> old) => true;
}
