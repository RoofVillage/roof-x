import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'semantic_color.dart';
import 'option.dart';

typedef _UseTheme = Function(RoofThemeOption theme);

class RoofTheme extends StatefulWidget {
  final Widget child;
  final RoofThemeOption theme;

  RoofTheme(this.theme, {this.child});

  static RoofInheritedTheme of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(RoofInheritedTheme);
  }

  @override
  State<StatefulWidget> createState() => RoofThemeState();
}

class RoofThemeState extends State<RoofTheme> {
  RoofThemeOption _current;

  @override
  void initState() {
    _current = widget.theme;
    super.initState();
  }

  void use(RoofThemeOption theme) {
    setState(() => this._current = theme);
  }

  @override
  Widget build(BuildContext context) {
    return RoofInheritedTheme(data: this, child: widget.child);
  }
}

class RoofInheritedTheme extends InheritedWidget {
  final RoofThemeOption current;
  final RoofSemanticColor color;

  final _UseTheme use;

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
    double opacity;
    switch (current) {
      case RoofThemeOption.light:
        blurRadius = 12;
        opacity = 0.2;
        break;
      case RoofThemeOption.dark:
        blurRadius = 16;
        opacity = 0.1;
        break;
    }
    return BoxShadow(
        color: color.background.general.withOpacity(opacity),
        blurRadius: blurRadius,
        offset: Offset(0, 5));
  }

  set current(RoofThemeOption newCurrent) {
    use(newCurrent);
  }

  RoofInheritedTheme(
      {Key key, @required RoofThemeState data, @required Widget child})
      : current = data._current,
        use = data.use,
        color = RoofSemanticColor(current: data._current),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(RoofInheritedTheme oldWidget) => true;
}
