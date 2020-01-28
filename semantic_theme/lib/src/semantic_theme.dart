import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:semantic_theme/src/semantic_theme_data.dart';

class SemanticTheme<T> extends StatefulWidget {
  final SemanticThemeData<T> themeData;
  final Widget child;

  SemanticTheme({
    @required this.themeData,
    @required this.child,
  });

  @override
  SemanticInheritedTheme<T> createState() => SemanticInheritedTheme<T>();

  static SemanticThemeData of(
    BuildContext context, {
    bool shouldRebuild = true,
  }) {
    final inheritedWidget = shouldRebuild
        ? context.dependOnInheritedWidgetOfExactType<_SemanticInheritedTheme>()
        : context.findAncestorWidgetOfExactType<_SemanticInheritedTheme>();

    return inheritedWidget.themeData;
  }
}

class SemanticInheritedTheme<T> extends State<SemanticTheme<T>> {
  T _currentThemeOption;

  @override
  void initState() {
    _currentThemeOption = widget.themeData.currentThemeOption;
    super.initState();
  }

  void use(T themeOption) => setState(() => _currentThemeOption = themeOption);

  @override
  Widget build(BuildContext context) {
    return _SemanticInheritedTheme(
      themeData: this.widget.themeData.forThemeOption(_currentThemeOption),
      child: widget.child,
    );
  }
}

class _SemanticInheritedTheme extends InheritedWidget {
  final SemanticThemeData themeData;

  _SemanticInheritedTheme({
    @required this.themeData,
    @required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(_SemanticInheritedTheme old) => true;
}
