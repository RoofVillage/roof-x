import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:padding/index.dart' as padding;
import 'package:distance/index.dart' as distance;
import 'package:duration/index.dart' as duration;
import 'package:curve/index.dart' as curve;
import 'package:corner_radius/index.dart' as corner_radius;
import 'package:typography/index.dart' as typography;
import 'package:theme/index.dart';
import 'package:haptics/index.dart';

class RoofSwitchField extends StatefulWidget {
  final String title;
  final bool initialValue;
  final int labelMaxLines;
  final Function(bool) onChanged;

  const RoofSwitchField(
      {this.title,
      this.initialValue = false,
      this.labelMaxLines = 3,
      this.onChanged});

  @override
  _RoofSwitchFieldState createState() => _RoofSwitchFieldState();
}

class _RoofSwitchFieldState extends State<RoofSwitchField>
    with SingleTickerProviderStateMixin {
  bool isOn;
  int labelMaxLines;
  Animation<Color> animation;
  AnimationController controller;

  final _typographyStyle = typography.title;
  final _duration = duration.short;

  initState() {
    isOn = widget.initialValue;
    controller = AnimationController(duration: _duration, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final secondaryTextColor = theme.color.text.secondary;
    final isOnColor = theme.color.background.primaryAction;
    final isOffColor = theme.color.background.inactiveAction;

    animation =
        ColorTween(begin: isOffColor, end: isOnColor).animate(controller)
          ..addListener(() {
            setState(() {});
          });

    isOn ? controller.forward() : controller.reverse();

    final labelContainer = Expanded(
      child: Text(
        widget.title,
        maxLines: labelMaxLines,
        style: _typographyStyle.textStyleWithColor(secondaryTextColor),
      ),
    );

    final switchColor = isOn ? isOnColor : isOffColor;
    final switchButton = _RoofAnimatedSwitch(isOn: isOn, color: switchColor);

    return GestureDetector(
        onTap: _onTap,
        child: Container(
            margin: padding.field2,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [labelContainer, switchButton])));
  }

  void _onTap() {
    triggerHapticWith(HapticOption.light);
    widget.onChanged(!isOn);
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
  final double _innerSpacing = 4.0;
  final _duration = duration.short;

  double get _leftMargin => distance.d;
  double get _radius => _height * 0.5;
  double get _aimatedContainerRadius => _animatedContainerWidth * 0.5;

  _RoofAnimatedSwitch({this.isOn, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: _width,
        height: _height,
        margin: EdgeInsets.only(left: _leftMargin),
        decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.all(Radius.circular(_radius))),
        child: Padding(
            padding: EdgeInsets.all(_innerSpacing),
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
                curve: curve.easy,
                duration: _duration)));
  }
}
