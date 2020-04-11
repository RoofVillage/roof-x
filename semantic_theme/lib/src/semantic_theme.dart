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

    return inheritedWidget.data.themeData;
  }

  static void setThemeOption(
    BuildContext context, {
    @required dynamic themeOption,
  }) {
    final inheritedWidget =
        context.dependOnInheritedWidgetOfExactType<_SemanticInheritedTheme>();

    assert(inheritedWidget != null, "SemanticInheritedTheme not found.");

    inheritedWidget.data.use(themeOption);

    inheritedWidget.data.themeData.themeOptionDidChange(themeOption);
  }
}

class SemanticInheritedTheme<T> extends State<SemanticTheme<T>> {
  T _currentThemeOption;

  SemanticThemeData<T> get themeData =>
      widget.themeData.build(_currentThemeOption);

  void _initializeCurrentThemeOption() async {
    print('initialize');
    final T themeOption = await widget.themeData.loadThemeOption() ??
        widget.themeData.currentThemeOption;

    use(themeOption);
  }

  @override
  void initState() {
    _initializeCurrentThemeOption();
    super.initState();
  }

  void use(T themeOption) => setState(() => _currentThemeOption = themeOption);

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
