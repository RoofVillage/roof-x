import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:spec/index.dart';
import '_action_button.dart';
import '_comment_box.dart';

class ThreadBottomBar extends StatefulWidget {
  final String threadActionTitle;
  final SmallIconReference threadActionIconReference;
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
  SmallIconReference threadActionIconReference;
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

  _buildAnimation(double _initialActionButtonWidth) {
    final double _buttonBaseWidth = _baseButtonSize.width;
    final curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = Tween(begin: _initialActionButtonWidth, end: _buttonBaseWidth)
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

    final Duration _duration = Duration(milliseconds: 180);
    controller = AnimationController(duration: _duration, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _rowChildren = [];

    void _isCommentBoxPopulated(String commentBoxContent) {
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

    Widget _fileButton = _FileButton(baseHeight: _baseHeight);
    _rowChildren.add(_fileButton);

    Widget _commentBox = CommentBox(onChangeCallback: _isCommentBoxPopulated);
    _rowChildren.add(_commentBox);

    if (threadAction != null) {
      double _animatedButtonWidth = animation != null ? animation.value : null;

      Widget _threadActionButton = ThreadActionButton(
          threadAction: threadAction,
          threadActionTitle: threadActionTitle,
          threadActionIconReference: threadActionIconReference,
          animatedWidth: _animatedButtonWidth,
          baseButtonSize: _baseButtonSize,
          buttonKey: _buttonKey);

      _rowChildren.add(_threadActionButton);
    }

    final Color _bottomBarColor = RoofColor.neutralColorA;
    final EdgeInsets _bottomBarPadding = RoofObjectPadding.containerPaddingA();

    final Widget _contentRow =
        Row(crossAxisAlignment: CrossAxisAlignment.end, children: _rowChildren);

    return SafeArea(
        top: false,
        left: false,
        right: false,
        child: Container(
            color: _bottomBarColor,
            padding: _bottomBarPadding,
            child: _contentRow));
  }
}

class _FileButton extends StatelessWidget {
  final double baseHeight;

  _FileButton({this.baseHeight});

  @override
  Widget build(BuildContext context) {
    final fileIcon =
        IconReference.cashSack.buildSvg(color: RoofColor.neutralColorF);

    return GestureDetector(
      child: Container(height: baseHeight, child: fileIcon),
    );
  }
}
