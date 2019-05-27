import 'package:flutter/material.dart';
import 'package:typography/index.dart' as typography;
import 'package:corner_radius/index.dart' as corner_radius;
import 'package:distance/index.dart' as distance;
import 'package:icon_library/index.dart';
import 'package:haptics/index.dart';

typedef ColorGetter = Color Function(BuildContext context);
typedef OnTap = void Function(BuildContext context);

mixin RoofCenteredButton {
  OnTap get onTap;
  String get text => null;
  ColorGetter get backgroundColor;
  ColorGetter get strokeColor => (BuildContext context) => Colors.transparent;
  ColorGetter get textColor;
  XSmallIconReference get icon;
}

mixin RoofCenteredButtonState {
  RoofCenteredButton get button;
  BuildContext get context;

  bool _tapped = false;
  final double _tappedOpacity = 0.75;
  final _textStyle = typography.button;
  final double _height = 50;
  final _tapHapticOption = HapticOption.light;
  final _spacing = distance.b;

  void setState(dynamic());

  Widget buildButton(BuildContext context) {
    final textColor = button.textColor(context);

    List<Widget> buttonChildren = [];

    if (button.icon != null) {
      final paddedIconWidget = Container(
        margin: EdgeInsets.only(right: _spacing),
        child: button.icon.buildSvg(color: textColor),
      );
      buttonChildren.add(paddedIconWidget);
    }

    final textDecoration = _textStyle.textStyleWithColor(textColor);

    final styledButtonText = Text(
      button.text,
      style: textDecoration,
      textAlign: TextAlign.center,
    );

    buttonChildren.add(styledButtonText);

    double opacity = _tapped ? _tappedOpacity : 1;

    final decoration = BoxDecoration(
      border: Border.all(color: button.strokeColor(context)),
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
    if (button.onTap != null) button.onTap(context);
  }

  void _onTapDown(TapDownDetails details) {
    triggerHapticWith(_tapHapticOption);
    setState(() => _tapped = true);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _tapped = false);
  }

  void _onTapCancel() {
    setState(() => _tapped = false);
  }
}
