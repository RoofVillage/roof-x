import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:standard_icon_library/index.dart';
import 'package:haptics/index.dart';
import 'package:tappable/index.dart';
import 'package:typedefs/index.dart';

mixin LeftStyleButton {
  ContextPasser get onTap;
  String get text;
  StandardIcon get iconReference => null;
  bool get hasArrow => true;
  ColorGetter get arrowColor;
  ColorGetter get backgroundColor;
  ColorGetter get textColor;
}

mixin LeftButtonState<T extends StatefulWidget> on Tappable<T> {
  LeftStyleButton get button;
  BuildContext get context;

  final double _height = 50;

  void setState(dynamic());

  Widget buildButton(BuildContext context) {
    final theme = SemanticTheme.of(context);

    List<Widget> buttonChildren = [];

    final textColor = button.textColor(context);

    if (button.iconReference != null) {
      final iconPadding = button.text != null
          ? EdgeInsets.only(right: theme.distance.padding.horizontal.small)
          : EdgeInsets.all(0);

      final buttonIcon = Container(
        padding: iconPadding,
        child: button.iconReference.buildWidget(color: textColor),
      );

      buttonChildren.add(buttonIcon);
    }

    final textDecoration = theme.typography.button.textStyle(color: textColor);

    final styledButtonText = Text(
      button.text,
      style: textDecoration,
      textAlign: TextAlign.center,
    );

    final textContainer = Expanded(child: styledButtonText);

    buttonChildren.add(textContainer);

    final rightArrowIcon = StandardIcon.upArrow.buildWidget(
      color: button.arrowColor(context),
    );

    buttonChildren.add(rightArrowIcon);

    final decoration = BoxDecoration(
      color: button.backgroundColor(context).withOpacity(tapped ? .7 : 1),
      borderRadius: BorderRadius.all(
        theme.radius.medium,
      ),
    );

    return buildTappedAwareGestureDetector(
      onTap: () => hapticAction(
        HapticOption.light,
        action: () => button.onTap(context),
      ),
      child: Container(
        height: _height,
        decoration: decoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buttonChildren,
        ),
      ),
    );
  }
}
