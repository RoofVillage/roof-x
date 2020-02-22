import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:standard_icon_library/index.dart';
import 'package:haptics/index.dart';
import 'package:typedefs/index.dart';

mixin ListStyleButton {
  ContextPasser get onTap;
  String get text;
  String get badgeText;
  StandardIcon get iconReference => null;
  ColorGetter get iconColor;
  ColorGetter get textColor;
  ColorGetter get badgeTextColor;
}

mixin ListButtonState {
  ListStyleButton get button;
  BuildContext get context;

  bool _tapped = false;
  double _tappedOpacity = 0.6;
  final double _height = 50;
  final _tapHapticOption = HapticOption.light;

  void setState(dynamic());

  Widget buildButton(BuildContext context) {
    final theme = SemanticTheme.of(context);

    List<Widget> buttonChildren = [];

    final textColor = button.textColor(context);

    if (button.iconReference != null) {
      final iconPadding = button.text != null
          ? EdgeInsets.only(right: theme.distance.spacing.horizontal.medium)
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
    );

    final textContainer = Expanded(child: styledButtonText);

    buttonChildren.add(textContainer);

    if (button.badgeText != null) {
      final badgeText = Text(
        button.badgeText,
        style: theme.typography.bodyHeavy.textStyle(
          color: button.badgeTextColor(context),
        ),
      );

      buttonChildren.add(badgeText);
    }

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
          padding: EdgeInsets.symmetric(
            horizontal: theme.distance.padding.horizontal.medium,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buttonChildren,
          ),
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
