import 'package:flutter/material.dart';
import 'package:button_builder/index.dart';
import 'package:haptics/index.dart';
import 'package:standard_icon_library/index.dart';

mixin IconStyleButton {
  OnTap get onTap;
  StandardIcon get iconReference;
  ColorGetter get iconColor;
  BuildContext get context;
  final _tapHapticOption = HapticOption.light;

  Widget buildButton(BuildContext context) {
    final iconWidget = iconReference.buildWidget(
      color: iconColor(context),
    );

    return GestureDetector(
      onTapDown: (details) => triggerHapticWith(_tapHapticOption),
      onTap: onTap,
      child: Container(
        child: iconWidget,
      ),
    );
  }
}
