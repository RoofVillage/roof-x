import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:icon_library/index.dart';
import 'package:typography/index.dart';
import 'package:haptics/index.dart';

typedef ColorGetter = Color Function(BuildContext context);

abstract class RoofButton extends StatefulWidget {
  final Function(BuildContext context) onTap;
  final String text;
  final StandardIconReference iconReference;

  ColorGetter get backgroundColor;
  ColorGetter get borderColor;
  ColorGetter get textColor;

  RoofButton({
    this.onTap,
    this.text,
    this.iconReference,
  });

  _RoofButtonState createState() => _RoofButtonState();
}

class _RoofButtonState extends State<RoofButton> {
  bool _tapped = false;
  double _tappedOpacity = 0.75;

  _RoofButtonState();

  final _textStyle = RoofTypography.button;

  @override
  Widget build(BuildContext context) {
    List<Widget> buttonChildren = [];

    final color = widget.textColor(context);

    if (widget.iconReference != null) {
      final iconPadding = widget.text != null
          ? EdgeInsets.only(right: RoofDistance.b)
          : EdgeInsets.all(0);

      final buttonIcon = Container(
          padding: iconPadding,
          child: widget.iconReference.buildSvg(color: color));

      buttonChildren.add(buttonIcon);
    }

    if (widget.text != null) {
      final textDecoration = _textStyle.textStyleWithColor(color);

      final styledButtonText =
          Text(widget.text, style: textDecoration, textAlign: TextAlign.center);

      buttonChildren.add(styledButtonText);
    }

    double opacity = _tapped ? _tappedOpacity : 1;

    final decoration = BoxDecoration(
      color: widget.backgroundColor(context).withOpacity(opacity),
      border: Border.all(width: 1, color: widget.borderColor(context)),
      borderRadius: BorderRadius.all(RoofCornerRadius.regular),
    );

    return GestureDetector(
      onTapDown: _onTapDown,
      onTap: _onTap,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: Container(
        height: RoofDistance.e2,
        decoration: decoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buttonChildren,
        ),
      ),
    );
  }

  void _onTap() {
    Haptic.triggerWith(HapticOption.light);
    if (widget.onTap != null) widget.onTap(context);
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
