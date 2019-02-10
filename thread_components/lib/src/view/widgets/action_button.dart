import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:spec/index.dart';
import 'package:typography/index.dart';
import 'package:theme/index.dart';

class ThreadActionButton extends StatelessWidget {
  final Function threadAction;
  final String threadActionTitle;
  final StandardIconReference threadActionIconReference;
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
    final theme = RoofTheme.of(context);

    final buttonDecoration = BoxDecoration(
        color: theme.color.background.transitionButton,
        border:
            Border.all(color: theme.color.stroke.transitionAction, width: 1.0),
        borderRadius: BorderRadius.all(RoofCornerRadius.regular));

    // animationWidthOffset ensures button children don't overflow while button is collapsing. value should be equal to the difference between baseButtonSize.width and the width of the button icon + total x-axis _containerPadding
    final double animationWidthOffset = 2;
    final double safeWidthForCollapse =
        baseButtonSize.width + animationWidthOffset;

    double textWidth;
    EdgeInsets containerPadding =
        EdgeInsets.fromLTRB(RoofDistance.b, 0, RoofDistance.b, 0);
        
    if (animatedWidth != null && animatedWidth <= safeWidthForCollapse) {
      textWidth = 0;
      containerPadding = null;
    }

    final buttonChildren = <Widget>[];

    final buttonIcon = Container(
      child: threadActionIconReference.buildSvg(
          color: theme.color.icon.transitionAction),
    );
    buttonChildren.add(buttonIcon);

    final buttonText =
        _AnimatedButtonText(text: threadActionTitle, textWidth: textWidth);
    buttonChildren.add(buttonText);

    return GestureDetector(
        onTap: threadAction,
        child: Container(
            key: buttonKey,
            width: animatedWidth,
            height: baseButtonSize.height,
            padding: containerPadding,
            decoration: buttonDecoration,
            child: Row(
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
        flex: 1,
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
