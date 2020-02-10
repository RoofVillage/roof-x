import 'package:flutter/material.dart';

class KeyboardAccessory extends StatefulWidget {
  final Widget child;

  KeyboardAccessory({this.child});

  static InheritedKeyboardAccessory of(BuildContext context,
      {bool shouldRebuild = true}) {
    final inheritedWidget = shouldRebuild
        ? context
            .dependOnInheritedWidgetOfExactType<_InheritedKeyboardAccessory>()
        : context.findAncestorWidgetOfExactType<_InheritedKeyboardAccessory>();

    return inheritedWidget.data;
  }

  @override
  State<StatefulWidget> createState() => InheritedKeyboardAccessory();
}

class InheritedKeyboardAccessory extends State<KeyboardAccessory> {
  Widget _child;

  bool _isHidden = false;

  set child(Widget child) {
    setState(() {
      _child = child;
      _isHidden = false;
    });
  }

  void hide() => setState(() => _isHidden = true);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [Expanded(child: widget.child)];

    if (!_isHidden && _child != null) children.add(_child);

    return _InheritedKeyboardAccessory(
      data: this,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}

class _InheritedKeyboardAccessory extends InheritedWidget {
  final InheritedKeyboardAccessory data;

  _InheritedKeyboardAccessory({@required this.data, @required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(_InheritedKeyboardAccessory old) => true;
}
