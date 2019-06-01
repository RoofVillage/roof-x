import 'package:flutter/material.dart';

class InheritedVisibilityManager extends StatefulWidget {
  final Widget child;

  InheritedVisibilityManager({this.child});

  @override
  VisibilityManager createState() => new VisibilityManager();

  static VisibilityManager of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_VisibilityManager)
            as _VisibilityManager)
        .data;
  }
}

class VisibilityManager extends State<InheritedVisibilityManager> {
  bool _visible;
  bool get visible => _visible;

  void setVisibility(bool newVal) {
    setState(() {
      _visible = newVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _VisibilityManager(
      data: this,
      child: widget.child,
    );
  }
}

class _VisibilityManager extends InheritedWidget {
  final VisibilityManager data;

  _VisibilityManager({Key key, this.data, Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(_VisibilityManager old) {
    return true;
  }
}
