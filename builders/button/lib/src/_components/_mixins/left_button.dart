import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:standard_icon_library/index.dart';
import 'package:haptics/index.dart';
import 'package:typedefs/index.dart';

mixin LeftStyleButton {
  ContextPasser get onTap;
  String get text;
  StandardIcon get iconReference => null;
  bool get hasArrow => true;
  ColorGetter get arrowColor;
  ColorGetter get backgroundColor;
  ColorGetter get textColor;
}

mixin LeftButtonState {
  LeftStyleButton get button;
  BuildContext get context;

  bool _tapped = false;
  double _tappedOpacity = 0.75;
  final double _height = 50;
  final _tapHapticOption = HapticOption.light;

  void setState(dynamic());

  Widget buildButton(BuildContext context) {
    final theme = SemanticTheme.of(context);

    List<Widget> buttonChildren = [];

    final textColor = button.textColor(context);

    if (button.iconReference != null) {
      final iconPadding = button.text != null
          ? EdgeInsets.only(right: theme.distance.padding.horizontal.small)
          : EdgeInsets.all(0);

      final buttonIcon = Container(
        padding: iconPadding,
        child: button.iconReference.buildWidget(color: textColor),
      );

      buttonChildren.add(buttonIcon);
    }

    final textDecoration = theme.typography.button.textStyle(color: textColor);

    final styledButtonText = Text(
      button.text,
      style: textDecoration,
      textAlign: TextAlign.center,
    );

    final textContainer = Expanded(child: styledButtonText);

    buttonChildren.add(textContainer);

    final rightArrowIcon = StandardIcon.upArrow.buildWidget(
      color: button.arrowColor(context),
    );

    buttonChildren.add(rightArrowIcon);

    double opacity = _tapped ? _tappedOpacity : 1;

    final decoration = BoxDecoration(
      color: button.backgroundColor(context).withOpacity(opacity),
      borderRadius: BorderRadius.all(
        theme.radius.medium,
      ),
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
