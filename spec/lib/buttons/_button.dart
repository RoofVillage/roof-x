import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:icon_library/index.dart';

class RoofButton extends StatefulWidget {
  final Function onTap;
  final String buttonText;
  final SmallIconReference iconReference;
  final BoxDecoration buttonDecoration;
  final TextStyle textDecoration;
  final double buttonHeight;

  const RoofButton(
      {this.onTap,
      this.buttonText,
      this.iconReference,
      this.buttonDecoration,
      this.textDecoration,
      this.buttonHeight});

  _RoofButtonState createState() => _RoofButtonState(
      onTap: onTap,
      buttonText: buttonText,
      iconReference: iconReference,
      buttonDecoration: buttonDecoration,
      buttonHeight: buttonHeight,
      textDecoration: textDecoration);
}

class _RoofButtonState extends State<RoofButton> {
  Function onTap;
  String buttonText;
  SmallIconReference iconReference;
  BoxDecoration buttonDecoration;
  double buttonHeight;
  TextStyle textDecoration;

  _RoofButtonState(
      {this.onTap,
      this.buttonText,
      this.iconReference,
      this.buttonDecoration,
      this.buttonHeight,
      this.textDecoration});

  static const double _defaultButtonHeight = 40;

  @override
  Widget build(BuildContext context) {
    buttonHeight = buttonHeight ?? _defaultButtonHeight;

    bool tapped = false;

    void doTap() {
      VibrateDevice.lightImpact();
      tapped = true;
      onTap();
      // .then(tapped = false);
    }

    List<Widget> _buttonChildren = [];

    if (iconReference != null) {
      final _iconPadding = buttonText != null
          ? EdgeInsets.fromLTRB(0, 0, RoofDistance.b, 0)
          : EdgeInsets.all(0);

      final _buttonIcon = Container(
          padding: _iconPadding,
          child: iconReference.buildSvg(color: RoofColor.blue));

      _buttonChildren.add(_buttonIcon);
    }

    if (buttonText != null) {
      final _buttonText =
          Text(buttonText, style: textDecoration, textAlign: TextAlign.center);

      _buttonChildren.add(_buttonText);
    }

    final _buttonPadding =
        EdgeInsets.fromLTRB(RoofDistance.c, 0, RoofDistance.c, 0);

    double _opacity = tapped ? .75 : 1;

    return GestureDetector(
        onTap: doTap,
        child: Opacity(
            opacity: _opacity,
            child: Container(
                height: buttonHeight,
                padding: _buttonPadding,
                decoration: buttonDecoration,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buttonChildren))));
  }
}
