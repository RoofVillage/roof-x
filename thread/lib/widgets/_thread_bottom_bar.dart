import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:spec/index.dart';
import '_action_button.dart';
import '_comment_box.dart';
import '_file_button.dart';

class ThreadBottomBar extends StatefulWidget {
  final String threadActionTitle;
  final StandardIconReference threadActionIconReference;
  final Function threadAction;

  ThreadBottomBar(
      {this.threadActionTitle,
      this.threadActionIconReference,
      this.threadAction});

  _ThreadBottomBarState createState() => _ThreadBottomBarState(
      threadActionTitle: threadActionTitle,
      threadActionIconReference: threadActionIconReference,
      threadAction: threadAction);
}

class _ThreadBottomBarState extends State<ThreadBottomBar>
    with SingleTickerProviderStateMixin {
  String threadActionTitle;
  StandardIconReference threadActionIconReference;
  Function threadAction;
  bool isTyping = false;
  Animation<double> animation;
  AnimationController controller;

  GlobalKey _buttonKey = GlobalKey(debugLabel: "testKey");
  double _initialActionButtonWidth;

  static const double _baseHeight = 44;
  final Size _baseButtonSize = Size(_baseHeight, _baseHeight);

  _ThreadBottomBarState(
      {this.threadActionTitle,
      this.threadActionIconReference,
      this.threadAction});

  _buildAnimation(double initialActionButtonWidth) {
    final double buttonBaseWidth = _baseButtonSize.width;
    final curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = Tween(begin: initialActionButtonWidth, end: buttonBaseWidth)
        .animate(curve)
          ..addListener(() {
            setState(() {});
          });
  }

  _getButtonSize(_) {
    if (_buttonKey.currentContext == null) return;
    final RenderBox threadActionButton =
        _buttonKey.currentContext.findRenderObject();
    _initialActionButtonWidth = threadActionButton.size.width;

    _buildAnimation(_initialActionButtonWidth);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_getButtonSize);
    super.initState();

    final Duration duration = Duration(milliseconds: 180);
    controller = AnimationController(duration: duration, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    void _isCommentBoxPopulated(String commentBoxContent) {
      print(commentBoxContent.length);
      if (commentBoxContent.length > 0 && !isTyping) {
        setState(() {
          isTyping = true;
        });
      } else if (commentBoxContent.length == 0 && isTyping) {
        setState(() {
          isTyping = false;
        });
      }
      isTyping ? controller.forward() : controller.reverse();
    }

    List<Widget> rowChildren = [];

    Widget fileButton = FileButton(baseHeight: _baseHeight);
    rowChildren.add(fileButton);

    Widget commentBox = CommentBox(onChangeCallback: _isCommentBoxPopulated);
    rowChildren.add(commentBox);

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

    final Color bottomBarColor = theme.color.background.brandPrimary;

    final EdgeInsets bottomBarPadding = RoofObjectPadding.container1;

    final Widget contentRow =
        Row(crossAxisAlignment: CrossAxisAlignment.end, children: rowChildren);

    return SafeArea(
        top: false,
        left: false,
        right: false,
        child: Container(
            color: bottomBarColor,
            padding: bottomBarPadding,
            child: contentRow));
  }
}
