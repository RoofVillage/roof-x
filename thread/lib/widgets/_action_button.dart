import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:spec/index.dart';

class ThreadActionButton extends StatelessWidget {
  final Function threadAction;
  final String threadActionTitle;
  final SmallIconReference threadActionIconReference;
  final double animatedWidth;
  final Size baseButtonSize;
  final Key buttonKey;

  ThreadActionButton(
      {this.threadAction,
      this.threadActionTitle,
      this.threadActionIconReference,
      this.animatedWidth,
      this.baseButtonSize,
      this.buttonKey});

  @override
  Widget build(BuildContext context) {
    final _buttonDecoration = BoxDecoration(
        color: RoofColor.neutralColorA,
        border: Border.all(color: RoofColor.blue, width: 1.0),
        borderRadius: BorderRadius.all(RoofCornerRadius.regular));

    double _textContainerWidth;
    EdgeInsets _containerPadding =
        EdgeInsets.fromLTRB(RoofDistance.b, 0, RoofDistance.b, 0);

    // animationWidthOffset ensures button children don't overflow while button is collapsing. value should be equal to the difference between baseButtonSize.width and the width of the button icon + total x-axis _containerPadding
    final double animationWidthOffset = 2;
    final double safeWidthForCollapse = baseButtonSize.width + animationWidthOffset;
    if (animatedWidth != null && animatedWidth <= safeWidthForCollapse) {
      _textContainerWidth = 0;
      _containerPadding = null;
    }

    final List<Widget> _buttonChildren = [];

    final _buttonIcon = Container(
      child: threadActionIconReference.buildSvg(color: RoofColor.blue),
    );
    _buttonChildren.add(_buttonIcon);

    final _buttonText = _AnimatedButtonText(
        text: threadActionTitle, textContainerWidth: _textContainerWidth);
    _buttonChildren.add(_buttonText);

    return GestureDetector(
        onTap: threadAction,
        child: Container(
            key: buttonKey,
            width: animatedWidth,
            height: baseButtonSize.height,
            padding: _containerPadding,
            decoration: _buttonDecoration,
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buttonChildren)));
  }
}

class _AnimatedButtonText extends StatelessWidget {
  final String text;
  final double textContainerWidth;

  _AnimatedButtonText({this.text, this.textContainerWidth});

  @override
  Widget build(BuildContext context) {
    final _buttonTextStyle = TextStyle(
        color: RoofColor.blue,
        fontSize: RoofFontSize.medium,
        fontWeight: RoofFontWeight.extraThick);

    final _textContainerPadding = EdgeInsets.fromLTRB(RoofDistance.b, 0, 0, 0);

    return Flexible(
        flex: 1,
        child: Container(
            width: textContainerWidth,
            padding: _textContainerPadding,
            child: Text(text,
                softWrap: false,
                overflow: TextOverflow.fade,
                style: _buttonTextStyle,
                textAlign: TextAlign.center)));
  }
}
