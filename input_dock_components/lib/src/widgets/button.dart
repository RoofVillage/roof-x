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

  buildWithProperties({bool collapse, double baseHeight}) {
    return _DockActionButton(
      action: action,
      actionTitle: actionTitle,
      actionIconReference: actionIconReference,
      isCollapsed: collapse,
      baseHeight: baseHeight,
    );
  }
}

class _DockActionButton extends StatefulWidget {
  final Function action;
  final String actionTitle;
  final StandardIconReference actionIconReference;
  final bool isCollapsed;
  final double baseHeight;

  _DockActionButton({
    this.action,
    this.actionTitle,
    this.actionIconReference,
    this.isCollapsed: false,
    this.baseHeight,
  });

  _DockActionButtonState createState() => _DockActionButtonState(
        baseButtonSize: Size(this.baseHeight, this.baseHeight),
      );
}

class _DockActionButtonState extends State<_DockActionButton>
    with SingleTickerProviderStateMixin {
  Size baseButtonSize;

  _DockActionButtonState({this.baseButtonSize});

  final GlobalKey _buttonKey = GlobalKey();
  final GlobalKey _buttonIconKey = GlobalKey();
  final double _buttonHorizontalPadding = RoofDistance.b;

  double minWidthToShowText = 0;
  double maxButtonWidth;
  double buttonIconWidth;
  Animation<double> widthAnimation;
  Animation<double> opacityAnimation;
  AnimationController controller;

  void _buildButtonAnimation(_) {
    _calculateComponentSizes();
    _buildAnimationFromMaxButtonWidth(maxButtonWidth);
  }

  void _calculateComponentSizes() {
    if (_buttonKey.currentContext == null) return;

    final RenderBox actionButtonRenderBox =
        _buttonKey.currentContext.findRenderObject();
    final RenderBox actionButtonIconRenderBox =
        _buttonIconKey.currentContext.findRenderObject();

    maxButtonWidth = actionButtonRenderBox.size.width;
    buttonIconWidth = actionButtonIconRenderBox.size.width;

    // minWidthToShowText ensures button children don't overflow while button is collapsing by removing the text precisely before overflow would occur. Value should be at least equal to ((width of the button icon) + (button x-axis containerPadding) + (borderWidth * 2))
    minWidthToShowText = buttonIconWidth + (_buttonHorizontalPadding * 2) + 2;
  }

  void _buildAnimationFromMaxButtonWidth(double maxButtonWidth) {
    final double minButtonWidth = baseButtonSize.width;

    final curve = CurvedAnimation(parent: controller, curve: RoofCurve.quick);

    widthAnimation = Tween(
      begin: maxButtonWidth,
      end: minButtonWidth,
    ).animate(curve)
      ..addListener(() {
        setState(() {});
      });

    opacityAnimation = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(curve)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_buildButtonAnimation);

    controller =
        AnimationController(duration: RoofDuration.short, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.isCollapsed ? controller.forward() : controller.reverse();

    final theme = RoofTheme.of(context);

    final buttonDecoration = BoxDecoration(
      border: Border.all(color: theme.color.stroke.transitionAction),
      borderRadius: BorderRadius.all(RoofCornerRadius.regular),
    );

    bool showText = true;
    EdgeInsets containerPadding =
        EdgeInsets.fromLTRB(RoofDistance.b, 0, RoofDistance.b, 0);

    final animatedWidth = widthAnimation != null ? widthAnimation.value : null;
    if (animatedWidth != null && animatedWidth <= minWidthToShowText) {
      showText = false;
      containerPadding = null;
    }

    final buttonChildren = <Widget>[];

    final buttonIcon = Container(
      key: _buttonIconKey,
      child: widget.actionIconReference
          .buildSvg(color: theme.color.icon.transitionAction),
    );

    final buttonText = _AnimatedButtonText(
      text: widget.actionTitle,
      show: showText,
      opacity: opacityAnimation != null ? opacityAnimation.value : 1,
    );

    buttonChildren.add(buttonIcon);
    buttonChildren.add(buttonText);

    return GestureDetector(
        onTap: widget.action,
        child: Container(
            key: _buttonKey,
            width: animatedWidth ?? null,
            height: baseButtonSize.height,
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
  final bool show;
  final double opacity;

  _AnimatedButtonText({this.text, this.show, this.opacity});

  final _buttonTextStyle = RoofTypography.button;

  @override
  Widget build(BuildContext context) {
    final buttonTextColor = RoofTheme.of(context).color.text.transitionAction;

    final textContainerPadding = EdgeInsets.fromLTRB(RoofDistance.b, 0, 0, 0);

    return Flexible(
      child: Container(
        width: show ? null : 0,
        padding: textContainerPadding,
        child: Opacity(
          opacity: opacity,
          child: Text(
            text,
            softWrap: false,
            overflow: TextOverflow.fade,
            style: _buttonTextStyle.textStyleWithColor(buttonTextColor),
          ),
        ),
      ),
    );
  }
}
