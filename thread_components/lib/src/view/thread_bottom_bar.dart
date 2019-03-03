import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:spec/index.dart';

import 'widgets/index.dart';

class ThreadBottomBar extends StatefulWidget {
  final String threadActionTitle;
  final StandardIconReference threadActionIconReference;
  final Function threadAction;
  final Color backgroundColor;

  ThreadBottomBar(
      {this.threadActionTitle,
      this.threadActionIconReference,
      this.backgroundColor,
      this.threadAction});

  _ThreadBottomBarState createState() => _ThreadBottomBarState(
      threadActionTitle: threadActionTitle,
      threadActionIconReference: threadActionIconReference,
      backgroundColor: backgroundColor,
      threadAction: threadAction);
}

class _ThreadBottomBarState extends State<ThreadBottomBar>
    with SingleTickerProviderStateMixin {
  String threadActionTitle;
  StandardIconReference threadActionIconReference;
  Function threadAction;
  Animation<double> animation;
  AnimationController controller;
  Color backgroundColor;
  bool shouldFocusComment = false;

  static const double _baseHeight = 44;
  final Size _baseButtonSize = Size(_baseHeight, _baseHeight);
  final GlobalKey _buttonKey = GlobalKey(debugLabel: "testKey");

  _ThreadBottomBarState(
      {this.threadActionTitle,
      this.threadActionIconReference,
      this.threadAction,
      this.backgroundColor});

  _buildAnimation(double maxButtonWidth) {
    final double minButtonWidth = _baseButtonSize.width;

    final Curve animationCurve = Curves.easeIn;
    final curve = CurvedAnimation(parent: controller, curve: animationCurve);

    animation = Tween(begin: maxButtonWidth, end: minButtonWidth).animate(curve)
      ..addListener(() {
        setState(() {});
      });
  }

  _getButtonSize(_) {
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

    final fileButton = FileButton(baseHeight: _baseHeight);
    rowChildren.add(fileButton);

    final commentBox = CommentBox(onChangeCallback: updateCommentFocus);
    rowChildren.add(commentBox);

    final sendButton = AnimatedSendButton(
        visible: shouldFocusComment, buttonHeight: _baseHeight);
    rowChildren.add(sendButton);

    if (threadAction != null) {
      double animatedButtonWidth = animation != null ? animation.value : null;

      Widget threadActionButton = ThreadActionButton(
          threadAction: threadAction,
          threadActionTitle: threadActionTitle,
          threadActionIconReference: threadActionIconReference,
          animatedWidth: animatedButtonWidth,
          baseButtonSize: _baseButtonSize,
          buttonKey: _buttonKey);

      rowChildren.add(threadActionButton);
    }

    final EdgeInsets bottomBarPadding = RoofObjectPadding.container1;

    final Widget contentRow =
        Row(crossAxisAlignment: CrossAxisAlignment.end, children: rowChildren);

    return SafeArea(
        top: false,
        left: false,
        right: false,
        child: Container(
            color: backgroundColor,
            padding: bottomBarPadding,
            child: contentRow));
  }
}
