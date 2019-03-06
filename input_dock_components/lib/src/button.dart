import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:spec/index.dart';
import 'package:typography/index.dart';
import 'package:theme/index.dart';

class DockActionButton {
  final Function action;
  final String actionTitle;
  final StandardIconReference actionIconReference;

  DockActionButton({this.action, this.actionTitle, this.actionIconReference});

  build({bool shrink}) {
    return _ActionButton(
      action: action,
      actionTitle: actionTitle,
      actionIconReference: actionIconReference,
      shrink: shrink,
    );
  }
}

class _ActionButton extends StatefulWidget {
  final Function action;
  final String actionTitle;
  final StandardIconReference actionIconReference;
  final bool shrink;

  _ActionButton({
    this.action,
    this.actionTitle,
    this.actionIconReference,
    this.shrink: false,
  });

  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<_ActionButton>
    with SingleTickerProviderStateMixin {
  final GlobalKey _buttonKey = GlobalKey(debugLabel: "testKey");
  final Size _baseButtonSize = Size(44, 44);

  Animation<double> widthAnimation;
  AnimationController controller;

  void _buildAnimation(double maxButtonWidth) {
    final double minButtonWidth = _baseButtonSize.width;

    final curve = CurvedAnimation(parent: controller, curve: RoofCurve.quick);

    widthAnimation =
        Tween(begin: maxButtonWidth, end: minButtonWidth).animate(curve)
          ..addListener(() {
            setState(() {});
          });
  }

  void _getActionButtonSize(_) {
    if (_buttonKey.currentContext == null) return;
    final RenderBox actionButtonRenderBox =
        _buttonKey.currentContext.findRenderObject();

    final double maxButtonWidth = actionButtonRenderBox.size.width;

    _buildAnimation(maxButtonWidth);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_getActionButtonSize);

    final Duration duration = RoofDuration.short;
    controller = AnimationController(duration: duration, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build button");
    widget.shrink ? controller.forward() : controller.reverse();
    final theme = RoofTheme.of(context);

    final buttonDecoration = BoxDecoration(
      border:
          Border.all(color: theme.color.stroke.transitionAction, width: 1.0),
      borderRadius: BorderRadius.all(
        RoofCornerRadius.regular,
      ),
    );

    // animationWidthOffset ensures button children don't overflow while button is collapsing. value should be equal to the difference between baseButtonSize.width and the width of the button icon + total x-axis containerPadding
    final double animationWidthOffset = 2;
    final double maxWidthForCollapse =
        _baseButtonSize.width + animationWidthOffset;

    double textWidth;
    EdgeInsets containerPadding =
        EdgeInsets.fromLTRB(RoofDistance.b, 0, RoofDistance.b, 0);

    if (widthAnimation != null && widthAnimation.value <= maxWidthForCollapse) {
      textWidth = 0;
      containerPadding = null;
    }

    final buttonChildren = <Widget>[];

    final buttonIcon = Container(
      child: widget.actionIconReference
          .buildSvg(color: theme.color.icon.transitionAction),
    );

    final buttonText =
        _AnimatedButtonText(text: widget.actionTitle, textWidth: textWidth);

    buttonChildren.add(buttonIcon);
    buttonChildren.add(buttonText);

    return GestureDetector(
        onTap: widget.action,
        child: Container(
            key: _buttonKey,
            width: widthAnimation != null ? widthAnimation.value : null,
            height: _baseButtonSize.height,
            padding: containerPadding,
            decoration: buttonDecoration,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: buttonChildren)));
  }
}

class _AnimatedButtonText extends StatelessWidget {
  final String text;
  final double textWidth;

  _AnimatedButtonText({this.text, this.textWidth});

  final _buttonTextStyle = RoofTypography.button;

  @override
  Widget build(BuildContext context) {
    final buttonTextColor = RoofTheme.of(context).color.text.transitionAction;

    final textContainerPadding = EdgeInsets.fromLTRB(RoofDistance.b, 0, 0, 0);

    return Flexible(
        child: Container(
            width: textWidth,
            padding: textContainerPadding,
            child: Text(text,
                softWrap: false,
                overflow: TextOverflow.fade,
                style: _buttonTextStyle.textStyleWithColor(buttonTextColor),
                textAlign: TextAlign.center)));
  }
}
