import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:icon_library/index.dart';
import 'package:spec/typography/index.dart';

class RoofButton extends StatefulWidget {
  final Function onTap;
  final String buttonText;
  final StandardIconReference iconReference;
  final BoxDecoration buttonDecoration;
  final Color contentColor;
  final double buttonHeight;

  RoofButton(
      {this.onTap,
      this.buttonText,
      this.iconReference,
      this.buttonDecoration,
      this.contentColor,
      this.buttonHeight});

  _RoofButtonState createState() => _RoofButtonState(
      onTap: onTap,
      buttonText: buttonText,
      iconReference: iconReference,
      buttonDecoration: buttonDecoration,
      contentColor: contentColor,
      buttonHeight: buttonHeight);
}

class _RoofButtonState extends State<RoofButton> {
  Function onTap;
  String buttonText;
  StandardIconReference iconReference;
  BoxDecoration buttonDecoration;
  Color contentColor;
  double buttonHeight;

  _RoofButtonState(
      {this.onTap,
      this.buttonText,
      this.iconReference,
      this.buttonDecoration,
      this.contentColor,
      this.buttonHeight});

  final _textStyle = RoofTypography.button;
  static const double _defaultButtonHeight = 40;

  @override
  Widget build(BuildContext context) {
    buttonHeight = buttonHeight ?? _defaultButtonHeight;

    bool tapped = false;

    void doTap() {
      RoofHaptic.triggerWith(RoofHapticOption.light);
      tapped = true;
      onTap();
      // .then(tapped = false);
    }

    List<Widget> buttonChildren = [];

    if (iconReference != null) {
      final iconPadding = buttonText != null
          ? EdgeInsets.fromLTRB(0, 0, RoofDistance.b, 0)
          : EdgeInsets.all(0);

      final buttonIcon = Container(
          padding: iconPadding,
          child: iconReference.buildSvg(color: contentColor));

      buttonChildren.add(buttonIcon);
    }

    if (buttonText != null) {
      final textDecoration = _textStyle.textStyleWithColor(contentColor);

      final styledButtonText =
          Text(buttonText, style: textDecoration, textAlign: TextAlign.center);

      buttonChildren.add(styledButtonText);
    }

    final buttonPadding =
        EdgeInsets.fromLTRB(RoofDistance.c, 0, RoofDistance.c, 0);

    double opacity = tapped ? .75 : 1;

    return GestureDetector(
        onTap: doTap,
        child: Opacity(
            opacity: opacity,
            child: Container(
                height: buttonHeight,
                padding: buttonPadding,
                decoration: buttonDecoration,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: buttonChildren))));
  }
}
