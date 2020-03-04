import 'package:flutter/material.dart';
import 'package:button_builder/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:x_small_icon_library/index.dart';
import 'package:haptics/index.dart';

mixin CenteredStyleButton {
  OnTap get onTap;
  String get text => null;
  ColorGetter get backgroundColor;
  ColorGetter get strokeColor => (BuildContext context) => Colors.transparent;
  ColorGetter get textColor;
  XSmallIcon get icon;
}

mixin CenteredStyleButtonState {
  CenteredStyleButton get button;
  BuildContext get context;

  bool _tapped = false;
  final double _tappedOpacity = 0.75;
  final double _height = 50;
  final _tapHapticOption = HapticOption.light;

  void setState(dynamic());

  Widget buildButton(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final textColor = button.textColor(context);

    List<Widget> buttonChildren = [];

    if (button.icon != null) {
      final paddedIconWidget = Container(
        margin: EdgeInsets.only(right: theme.distance.spacing.horizontal.small),
        child: button.icon.buildWidget(color: textColor),
      );
      buttonChildren.add(paddedIconWidget);
    }

    final textDecoration = theme.typography.button.textStyle(color: textColor);

    final styledButtonText = Text(
      button.text,
      style: textDecoration,
      textAlign: TextAlign.center,
    );

    buttonChildren.add(styledButtonText);

    final decoration = BoxDecoration(
      border: Border.all(color: button.strokeColor(context)),
      color: button.backgroundColor(context),
      borderRadius: BorderRadius.all(theme.radius.medium),
    );

    double opacity = _tapped ? _tappedOpacity : 1;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTap: _onTap,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: Opacity(
        opacity: opacity,
        child: Container(
          height: _height,
          decoration: decoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buttonChildren,
          ),
        ),
      ),
    );
  }

  void _onTap() {
    if (button.onTap != null) button.onTap();
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
