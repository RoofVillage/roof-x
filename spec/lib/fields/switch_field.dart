import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import 'package:spec/object_padding.dart';
import 'package:spec/typography/index.dart';
import 'package:spec/haptics/index.dart';
import 'package:spec/theme/index.dart';

import 'package:spec/distance.dart';
import 'package:spec/duration.dart';

class RoofSwitchField extends StatefulWidget {
  final String title;
  final bool isOnInitially;
  final int labelMaxLines;

  static const int _defaultLabelMaxLines = 3;
  static const bool _isOnInitially = false;

  const RoofSwitchField(
      {this.title,
      this.isOnInitially = _isOnInitially,
      this.labelMaxLines = _defaultLabelMaxLines});

  @override
  _RoofSwitchFieldState createState() => _RoofSwitchFieldState(
      title: title, isOn: isOnInitially, labelMaxLines: labelMaxLines);
}

class _RoofSwitchFieldState extends State<RoofSwitchField>
    with SingleTickerProviderStateMixin {
  String title;
  bool isOn;
  int labelMaxLines;
  Animation<Color> animation;
  AnimationController controller;

  final _typographyStyle = RoofTypography.title1;
  final _duration = RoofDuration.short;

  _RoofSwitchFieldState({this.title, this.isOn, this.labelMaxLines});

  initState() {
    super.initState();
    controller = AnimationController(duration: _duration, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final secondaryTextColor = theme.color.text.secondary;
    final isOnColor = theme.color.action.submit;
    final isOffColor = theme.color.action.inactive;

    animation =
        ColorTween(begin: isOffColor, end: isOnColor).animate(controller)
          ..addListener(() {
            setState(() {});
          });

    isOn ? controller.forward() : controller.reverse();

    final labelContainer = Expanded(
      child: Text(
        title,
        maxLines: labelMaxLines,
        style: _typographyStyle.textStyleWithColor(secondaryTextColor),
      ),
    );

    final switchColor = isOn ? isOnColor : isOffColor;
    final switchButton = _RoofAnimatedSwitch(isOn: isOn, color: switchColor);

    return GestureDetector(
        onTap: _onTap,
        child: Container(
            margin: RoofObjectPadding.field1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [labelContainer, switchButton])));
  }

  void _onTap() {
    RoofHaptic.triggerWith(RoofHapticOption.light);
    setState(() {
      isOn = !isOn;
    });
  }
}

class _RoofAnimatedSwitch extends StatelessWidget {
  final bool isOn;
  final Color color;

  final double _width = 52;
  final double _animatedContainerWidth = 24;
  final double _height = 34;
  final _duration = RoofDuration.short;

  double get _radius => _height * 0.5;
  double get _aimatedContainerRadius => _animatedContainerWidth * 0.5;

  _RoofAnimatedSwitch({this.isOn, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: _width,
        height: _height,
        margin: EdgeInsets.fromLTRB(RoofDistance.d, 0, 0, 0),
        decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.all(Radius.circular(_radius))),
        child: Padding(
            padding: EdgeInsets.all(4.0),
            child: AnimatedAlign(
                child: Container(
                  width: _animatedContainerWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(_aimatedContainerRadius)),
                    color: color,
                  ),
                ),
                alignment: isOn ? Alignment(1.0, 0.0) : Alignment(-1.0, 0.0),
                curve: Curves.easeIn,
                duration: _duration)));
  }
}
