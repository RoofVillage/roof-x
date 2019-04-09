import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:icon_library/index.dart';
import 'package:typography/index.dart';
import 'package:haptics/index.dart';

typedef ColorGetter = Color Function(BuildContext context);
typedef OnTap = void Function(BuildContext context);

mixin RoofLeftButton {
  OnTap get onTap;
  String get text;
  StandardIconReference get iconReference => null;
  bool get hasArrow => true;
  ColorGetter get arrowColor;
  ColorGetter get backgroundColor;
  ColorGetter get textColor;
}

mixin RoofLeftButtonState {
  RoofLeftButton get button;
  BuildContext get context;

  bool _tapped = false;
  double _tappedOpacity = 0.75;
  final _textStyle = RoofTypography.button;
  final double _height = 50;

  void setState(dynamic());

  Widget buildButton(BuildContext context) {
    List<Widget> buttonChildren = [];

    final textColor = button.textColor(context);

    if (button.iconReference != null) {
      final iconPadding = button.text != null
          ? EdgeInsets.only(right: RoofDistance.b)
          : EdgeInsets.all(0);

      final buttonIcon = Container(
          padding: iconPadding,
          child: button.iconReference.buildSvg(color: textColor));

      buttonChildren.add(buttonIcon);
    }

    final textDecoration = _textStyle.textStyleWithColor(textColor);

    final styledButtonText =
        Text(button.text, style: textDecoration, textAlign: TextAlign.center);

    final textContainer = Expanded(child: styledButtonText);

    buttonChildren.add(textContainer);

    final rightArrowIcon =
        IconReference.upArrow.buildSvg(color: button.arrowColor(context));

    buttonChildren.add(rightArrowIcon);

    double opacity = _tapped ? _tappedOpacity : 1;

    final decoration = BoxDecoration(
      color: button.backgroundColor(context).withOpacity(opacity),
      borderRadius: BorderRadius.all(RoofCornerRadius.regular),
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
