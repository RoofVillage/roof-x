import 'package:flutter/material.dart';
import 'package:spec/object_padding.dart';
import 'package:spec/color.dart';
import 'package:flutter/animation.dart';
import 'package:spec/device_haptic.dart';
import 'package:spec/font_size.dart';

import 'package:spec/distance.dart';

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
        style: _fieldContentTextStyle(),
      ),
    );

    Widget switchButton =
        _RoofAnimatedSwitch(value: value, color: animation.value);

    return GestureDetector(
        onTap: () => _onChanged(),
        child: Container(
            margin: RoofObjectPadding.fieldPaddingA(),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [labelContainer, switchButton])));
  }

  TextStyle _fieldContentTextStyle() {
    return TextStyle(
        fontSize: RoofFontSize.medium, color: RoofColor.neutralColorG);
  }
}

class _RoofAnimatedSwitch extends StatelessWidget {
  final bool value;
  final Color color;

  _RoofAnimatedSwitch({this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 52,
        height: 34,
        margin: EdgeInsets.fromLTRB(RoofDistance.d, 0, 0, 0),
        decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.all(Radius.circular(17))),
        child: Padding(
            padding: EdgeInsets.all(4.0),
            child: AnimatedAlign(
                child: Container(
                  width: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: color,
                  ),
                ),
                alignment: value ? Alignment(1.0, 0.0) : Alignment(-1.0, 0.0),
                curve: Curves.easeIn,
                duration: Duration(milliseconds: 180))));
  }
}
