import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:form_body_builder/src/_components/fields/_widgets/index.dart';
import 'package:haptics/index.dart';
import 'package:semantic_theme/index.dart';

class RoofSwitchField extends StatefulWidget {
  final String title;
  final bool initialValue;
  final int labelMaxLines;
  final Function(bool) onChanged;

  const RoofSwitchField({
    this.title,
    this.initialValue = false,
    this.labelMaxLines = 3,
    this.onChanged,
  });

  @override
  _RoofSwitchFieldState createState() => _RoofSwitchFieldState();
}

class _RoofSwitchFieldState extends State<RoofSwitchField>
    with SingleTickerProviderStateMixin {
  bool isOn;
  int labelMaxLines;
  Animation<Color> animation;
  AnimationController controller;
  Color isOnColor;
  Color isOffColor;

  initState() {
    isOn = widget.initialValue;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    controller = AnimationController(
      duration: SemanticTheme.of(context).duration.short,
      vsync: this,
    );

    final theme = SemanticTheme.of(context);

    isOnColor = theme.color.background.actionPrimary;
    isOffColor = theme.color.background.actionDisabled;

    animation = ColorTween(
      begin: isOffColor,
      end: isOnColor,
    )
        .chain(
          CurveTween(
            curve: theme.curve.hurried,
          ),
        )
        .animate(controller)
          ..addListener(() {
            setState(() {});
          });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    isOn ? controller.forward() : controller.reverse();

    final labelContainer = Expanded(
      child: FieldLabel(labelText: widget.title),
    );

    final switchColor = animation.value;
    final switchButton = _RoofAnimatedSwitch(isOn: isOn, color: switchColor);

    return GestureDetector(
      onTap: () => hapticAction(
        HapticOption.light,
        action: _setIsOn,
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [labelContainer, switchButton],
        ),
      ),
    );
  }

  void _setIsOn() {
    widget.onChanged(!isOn);
    setState(() {
      isOn = !isOn;
    });
  }
}

class _RoofAnimatedSwitch extends StatelessWidget {
  final bool isOn;
  final Color color;

  final double _width = 50;
  final double _height = 28;
  final double _innerSpacing = 4.0;

  double get _radius => _height * 0.5;
  double get _animatedContainerWidth =>
      _height - _innerSpacing * 2 - 2; // subtract 2 for border width * 2
  double get _animatedContainerRadius => _animatedContainerWidth * 0.5;

  _RoofAnimatedSwitch({this.isOn, this.color});

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    return Container(
      width: _width,
      height: _height,
      margin: EdgeInsets.only(
        left: theme.distance.spacing.horizontal.medium,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.all(Radius.circular(_radius)),
      ),
      child: Padding(
        padding: EdgeInsets.all(_innerSpacing),
        child: AnimatedAlign(
          child: Container(
            width: _animatedContainerWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(_animatedContainerRadius),
              ),
              color: color,
            ),
          ),
          alignment: isOn ? Alignment(1.0, 0.0) : Alignment(-1.0, 0.0),
          curve: theme.curve.hurried,
          duration: theme.duration.short,
        ),
      ),
    );
  }
}
