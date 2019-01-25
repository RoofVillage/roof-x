export 'option.dart';

import 'package:flutter/material.dart';

import 'option.dart';
import '_background_color.dart';
import '_icon_color.dart';
import '_stroke_color.dart';
import '_type_color.dart';
import '_system_color.dart';

typedef UseTheme = Function(RoofThemeOption theme);

class RoofThemeSpec {
  final RoofThemeOption _current;
  RoofThemeOption get current => _current;
  set current(RoofThemeOption newCurrent) {
    use(newCurrent);
  }

  final RoofStrokeColor strokeColor;
  final RoofBackgroundColor backgroundColor;
  final RoofTypeColor typeColor;
  final RoofIconColor iconColor;
  final RoofSystem system;

  final UseTheme use;

  RoofThemeSpec({@required RoofThemeOption current, @required this.use})
      : this._current = current,
        strokeColor = RoofStrokeColor(current),
        backgroundColor = RoofBackgroundColor(current),
        typeColor = RoofTypeColor(current),
        iconColor = RoofIconColor(current),
        system = RoofSystem(current);
}

class RoofTheme extends StatefulWidget {
  final Widget child;
  final RoofThemeOption theme;

  RoofTheme(this.theme, {this.child});

  static RoofThemeSpec of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_RoofInheritedStateContainer)
            as _RoofInheritedStateContainer)
        .spec;
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
    return _RoofInheritedStateContainer(data: this, child: widget.child);
  }
}

class _RoofInheritedStateContainer extends InheritedWidget {
  final RoofThemeSpec spec;
  _RoofInheritedStateContainer(
      {Key key, @required RoofThemeState data, @required Widget child})
      : spec = RoofThemeSpec(current: data.current, use: data.use),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_RoofInheritedStateContainer oldWidget) => true;
}
