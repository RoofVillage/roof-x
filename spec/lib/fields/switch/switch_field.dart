import 'package:flutter/material.dart';
import 'package:spec/field_styles.dart';
import 'package:spec/object_padding.dart';
import 'package:spec/color.dart';
import 'widgets/_animated_switch.dart';
import 'package:flutter/animation.dart';
import 'package:spec/device_haptics.dart';

class RoofSwitchField extends StatefulWidget {
  final String title;
  final bool initialValue;
  final int labelMaxLines;

  const RoofSwitchField(
      {this.title, this.initialValue, this.labelMaxLines = 3});

  @override
  _RoofSwitchFieldState createState() => _RoofSwitchFieldState(
      title: title, value: initialValue ?? false, labelMaxLines: labelMaxLines);
}

class _RoofSwitchFieldState extends State<RoofSwitchField>
    with SingleTickerProviderStateMixin {
  String title;
  bool value;
  int labelMaxLines;
  Animation<Color> animation;
  AnimationController controller;

  _RoofSwitchFieldState({this.title, this.value, this.labelMaxLines});

  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 180), vsync: this);
    animation =
        ColorTween(begin: RoofColor.neutralColorE, end: RoofColor.highlight)
            .animate(controller)
              ..addListener(() {
                setState(() {
                  // value = value;
                });
              });
  }

  @override
  Widget build(BuildContext context) {
    value ? controller.forward() : controller.reverse();

    void _onChanged() {
      VibrateDevice.lightImpact();
      setState(() {
        value = !value;
      });
    }

    Widget labelContainer = Expanded(
      child: Text(
        title,
        maxLines: labelMaxLines,
        style: RoofFieldStyle.fieldContentTextStyle(),
      ),
    );

    Widget switchButton =
        RoofAnimatedSwitch(value: value, color: animation.value);

    return GestureDetector(
        onTap: () => _onChanged(),
        child: Container(
            margin: RoofObjectPadding.fieldPaddingA(),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [labelContainer, switchButton])));
  }
}
