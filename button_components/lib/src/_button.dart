import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:icon_library/index.dart';
import 'package:typography/index.dart';
import 'package:haptics/index.dart';

typedef ColorGetter = Color Function(BuildContext context);

abstract class RoofButton extends StatefulWidget {
  final Function onTap;
  final String text;
  final StandardIconReference iconReference;
  final double height;

  ColorGetter get backgroundColor;
  ColorGetter get textColor;

  RoofButton(
      {this.onTap,
      this.text,
      this.iconReference,
      this.height = RoofDistance.e});

  _RoofButtonState createState() => _RoofButtonState(
      onTap: onTap,
      text: text,
      iconReference: iconReference,
      backgroundColor: backgroundColor,
      textColor: textColor,
      height: height);
}

class _RoofButtonState extends State<RoofButton> {
  Function onTap;
  String text;
  StandardIconReference iconReference;
  ColorGetter backgroundColor;
  ColorGetter textColor;
  double height;

  bool _tapped = false;
  double _tappedOpacity = 0.75;

  _RoofButtonState(
      {this.onTap,
      this.text,
      this.iconReference,
      this.backgroundColor,
      this.textColor,
      this.height});

  final _textStyle = RoofTypography.button;

  @override
  Widget build(BuildContext context) {
    List<Widget> buttonChildren = [];

    final color = textColor(context);

    if (iconReference != null) {
      final iconPadding = text != null
          ? EdgeInsets.fromLTRB(0, 0, RoofDistance.b, 0)
          : EdgeInsets.all(0);

      final buttonIcon = Container(
          padding: iconPadding, child: iconReference.buildSvg(color: color));

      buttonChildren.add(buttonIcon);
    }

    if (text != null) {
      final textDecoration = _textStyle.textStyleWithColor(color);

      final styledButtonText =
          Text(text, style: textDecoration, textAlign: TextAlign.center);

      buttonChildren.add(styledButtonText);
    }

    double opacity = _tapped ? _tappedOpacity : 1;

    final decoration = BoxDecoration(
        color: backgroundColor(context).withOpacity(opacity),
        borderRadius: BorderRadius.all(RoofCornerRadius.regular));

    return GestureDetector(
        onTapDown: _onTapDown,
        onTap: _onTap,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: Container(
            height: height,
            decoration: decoration,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buttonChildren)));
  }

  void _onTap() {
    RoofHaptic.triggerWith(RoofHapticOption.light);
    onTap();
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _tapped = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _tapped = false;
    });
  }

  void _onTapCancel() {
    setState(() {
      _tapped = false;
    });
  }
}
