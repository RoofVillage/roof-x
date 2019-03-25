import 'package:flutter/material.dart';

class KeyboardAccessory extends StatefulWidget {
  final Widget child;

  KeyboardAccessory({this.child});

  static InheritedKeyboardAccessory of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(InheritedKeyboardAccessory);
  }

  @override
  State<StatefulWidget> createState() => _KeyboardAccessoryState();
}

class _KeyboardAccessoryState extends State<KeyboardAccessory> {
  Widget _child;

  bool _isHidden = false;

  set child(Widget child) {
    setState(() {
      _child = child;
      _isHidden = false;
    });
  }

  hide() {
    setState(() => _isHidden = true);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [Expanded(child: widget.child)];

    if (!_isHidden && _child != null) {
      children.add(_child);
    }

    return InheritedKeyboardAccessory(
        state: this,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children));
  }
}

class InheritedKeyboardAccessory extends InheritedWidget {
  final _KeyboardAccessoryState _state;

  void hide() => _state.hide();

  set child(Widget child) => _state.child = child;

  InheritedKeyboardAccessory(
      {Key key,
      @required _KeyboardAccessoryState state,
      @required Widget child})
      : _state = state,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedKeyboardAccessory oldWidget) => true;
}
