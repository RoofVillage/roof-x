import 'package:flutter/material.dart';
import 'package:typography/index.dart' as typography;
import 'package:corner_radius/index.dart' as corner_radius;
import 'package:haptics/index.dart';

typedef ColorGetter = Color Function(BuildContext context);
typedef OnTap = void Function(BuildContext context);

mixin RoofCenteredButton {
  OnTap get onTap;
  String get text => null;
  ColorGetter get backgroundColor;
  ColorGetter get textColor;
}

mixin RoofCenteredButtonState {
  RoofCenteredButton get button;
  BuildContext get context;

  bool _tapped = false;
  double _tappedOpacity = 0.75;
  final _textStyle = typography.button;
  final double _height = 50;

  void setState(dynamic());

  Widget buildButton(BuildContext context) {
    List<Widget> buttonChildren = [];

    final color = button.textColor(context);

    final textDecoration = _textStyle.textStyleWithColor(color);

    final styledButtonText = Text(
      button.text,
      style: textDecoration,
      textAlign: TextAlign.center,
    );

    buttonChildren.add(styledButtonText);

    double opacity = _tapped ? _tappedOpacity : 1;

    final decoration = BoxDecoration(
      color: button.backgroundColor(context).withOpacity(opacity),
      borderRadius: BorderRadius.all(corner_radius.regular),
    );

    return GestureDetector(
      onTapDown: _onTapDown,
      onTap: _onTap,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: Container(
        height: _height,
        decoration: decoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buttonChildren,
        ),
      ),
    );
  }

  void _onTap() {
    triggerHapticWith(HapticOption.light);
    if (button.onTap != null) button.onTap(context);
  }

  void _onTapDown(TapDownDetails details) {
    setState(() => _tapped = true);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _tapped = false);
  }

  void _onTapCancel() {
    setState(() => _tapped = false);
  }
}
