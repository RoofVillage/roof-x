import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:typography/index.dart';
import 'package:theme/index.dart';
import 'package:haptics/index.dart';

class RoofSwitchField extends StatefulWidget {
  final String title;
  final bool isOnInitially;
  final int labelMaxLines;
  final Function(bool) onChanged;

  static const int _defaultLabelMaxLines = 3;
  static const bool _isOnInitially = false;

  const RoofSwitchField(
      {this.title,
      this.isOnInitially = _isOnInitially,
      this.labelMaxLines = _defaultLabelMaxLines,
      this.onChanged});

  @override
  _RoofSwitchFieldState createState() => _RoofSwitchFieldState(
      title: title,
      isOn: isOnInitially,
      labelMaxLines: labelMaxLines,
      onChanged: onChanged);
}

class _RoofSwitchFieldState extends State<RoofSwitchField>
    with SingleTickerProviderStateMixin {
  String title;
  bool isOn;
  int labelMaxLines;
  Animation<Color> animation;
  AnimationController controller;
  Function(bool) onChanged;

  final _typographyStyle = RoofTypography.title1;
  final _duration = RoofDuration.short;

  _RoofSwitchFieldState(
      {this.title, this.isOn, this.labelMaxLines, this.onChanged});

  initState() {
    super.initState();
    controller = AnimationController(duration: _duration, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final secondaryTextColor = theme.color.text.secondary;
    final isOnColor = theme.color.background.submitButton;
    final isOffColor = theme.color.background.inactiveButton;

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
            margin: RoofObjectPadding.field2,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [labelContainer, switchButton])));
  }

  void _onTap() {
    Haptic.triggerWith(HapticOption.light);
    onChanged(!isOn);
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
  final _duration = RoofDuration.short;

  double get _leftMargin => RoofDistance.d;
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
                curve: RoofCurve.easy,
                duration: _duration)));
  }
}
