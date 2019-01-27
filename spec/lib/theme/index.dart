export 'option.dart';

import 'package:flutter/material.dart';
import 'package:spec/colors/index.dart';
import 'package:flutter/services.dart';

import 'option.dart';

typedef UseTheme = Function(RoofThemeOption theme);

class RoofTheme extends StatefulWidget {
  final Widget child;
  final RoofThemeOption theme;

  RoofTheme(this.theme, {this.child});

  static RoofInheritedTheme of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(RoofInheritedTheme);
  }

  @override
  State<StatefulWidget> createState() => RoofThemeState(theme);
}

class RoofThemeState extends State<RoofTheme> {
  RoofThemeOption current;

  RoofThemeState(RoofThemeOption current)
      : this.current = current,
        super();

  void use(RoofThemeOption theme) {
    setState(() => this.current = theme);
  }

  @override
  Widget build(BuildContext context) {
    return RoofInheritedTheme(data: this, child: widget.child);
  }
}

class RoofInheritedTheme extends InheritedWidget {
  final RoofThemeOption current;
  final RoofSemanticColor color;

  final UseTheme use;

  SystemUiOverlayStyle get systemChromeStyle {
    switch (current) {
      case RoofThemeOption.light:
        return SystemUiOverlayStyle.dark;
      case RoofThemeOption.dark:
        return SystemUiOverlayStyle.light;
    }
    return null;
  }

  BoxShadow get shadow {
    double blurRadius;
    switch (current) {
      case RoofThemeOption.light:
        blurRadius = 12;
        break;
      case RoofThemeOption.dark:
        blurRadius = 16;
        break;
    }
    return BoxShadow(
        color: color.background.general.withAlpha((0.2 * 255).floor()),
        blurRadius: blurRadius,
        offset: Offset(0, 5));
  }

  set current(RoofThemeOption newCurrent) {
    use(newCurrent);
  }

  RoofInheritedTheme(
      {Key key, @required RoofThemeState data, @required Widget child})
      : current = data.current,
        use = data.use,
        color = RoofSemanticColor(current: data.current),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(RoofInheritedTheme oldWidget) => true;
}
