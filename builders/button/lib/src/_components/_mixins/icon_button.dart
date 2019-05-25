import 'package:flutter/material.dart';
import 'package:haptics/index.dart';
import 'package:icon_library/index.dart';

typedef ColorGetter = Color Function(BuildContext context);
typedef OnTap = void Function(BuildContext context);

mixin RoofIconButton {
  OnTap get onTap;
  StandardIconReference get iconReference;
  ColorGetter get iconColor;
  BuildContext get context;
  final _tapHapticOption = HapticOption.light;

  Widget buildButton(BuildContext context) {
    final iconWidget = iconReference.buildSvg(
      color: iconColor(context),
    );

    return GestureDetector(
      onTapDown: (details) => triggerHapticWith(_tapHapticOption),
      onTap: () => onTap(context),
      child: Container(
        child: iconWidget,
      ),
    );
  }
}
