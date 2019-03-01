import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';

import 'button.dart';
import 'field.dart';

class RoofInputDock extends StatefulWidget {
  final DockInputButton inputButton;
  final bool hasInputField;
  final List<Widget> auxiliaryWidgets;

  RoofInputDock({this.inputButton, this.hasInputField, this.auxiliaryWidgets});

  @override
  State<StatefulWidget> createState() => _RoofInputDockState();
}

class _RoofInputDockState extends State<RoofInputDock>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  bool shouldFocusComment = false;

  static const double _baseHeight = 44;
  final Size _baseButtonSize = Size(_baseHeight, _baseHeight);
  final GlobalKey _buttonKey = GlobalKey(debugLabel: "testKey");

  void _buildAnimation(double maxButtonWidth) {
    final double minButtonWidth = _baseButtonSize.width;

    final Curve animationCurve = Curves.easeIn;
    final curve = CurvedAnimation(parent: controller, curve: animationCurve);

    animation = Tween(begin: maxButtonWidth, end: minButtonWidth).animate(curve)
      ..addListener(() {
        setState(() {});
      });
  }

  void _getButtonSize(_) {
    if (_buttonKey.currentContext == null) return;
    final RenderBox threadActionButton =
        _buttonKey.currentContext.findRenderObject();

    final double maxButtonWidth = threadActionButton.size.width;

    _buildAnimation(maxButtonWidth);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_getButtonSize);
    super.initState();

    final Duration duration = RoofDuration.short;
    controller = AnimationController(duration: duration, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    void animateButton(bool shouldFocusComment) {
      shouldFocusComment ? controller.forward() : controller.reverse();
    }

    void updateCommentFocus(String text) {
      bool buttonShouldUpdate = false;

      if (text.isNotEmpty && !shouldFocusComment) {
        shouldFocusComment = true;
        buttonShouldUpdate = true;
      } else if (text.isEmpty && shouldFocusComment) {
        shouldFocusComment = false;
        buttonShouldUpdate = true;
      }

      if (buttonShouldUpdate) {
        setState(() {});
        animateButton(shouldFocusComment);
      }
    }

    List<Widget> rowChildren = [];

    if (widget.auxiliaryWidgets != null && widget.auxiliaryWidgets.isNotEmpty) {
      rowChildren.addAll(widget.auxiliaryWidgets);
    }

    if (widget.hasInputField) {
      final commentBox = DockInputField(onChange: updateCommentFocus);
      rowChildren.add(commentBox);
    }

    if (widget.inputButton != null) {
      rowChildren.add(widget.inputButton);
    }

    final EdgeInsets bottomBarPadding = RoofObjectPadding.container1;

    final Widget contentRow =
        Row(crossAxisAlignment: CrossAxisAlignment.end, children: rowChildren);

    final theme = RoofTheme.of(context);
    return SafeArea(
        top: false,
        left: false,
        right: false,
        child: Container(
            color: theme.color.background.brandSecondary,
            padding: bottomBarPadding,
            child: contentRow));
  }
}
