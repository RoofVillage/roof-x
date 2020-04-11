import 'package:flutter/material.dart';
import 'package:button_builder/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:vertically_centered_text_builder/index.dart';
import 'package:tappable/index.dart';
import 'package:x_small_icon_library/index.dart';
import 'package:haptics/index.dart';

mixin CenteredStyleButton {
  OnTap get onTap;
  String get text => null;
  ColorGetter get backgroundColor;
  ColorGetter get strokeColor => (BuildContext context) => Colors.transparent;
  ColorGetter get textColor;
  XSmallIcon get icon;
}

mixin CenteredStyleButtonState<T extends StatefulWidget>
    on Tappable<T>, VerticallyCenteredTextBuilder {
  CenteredStyleButton get button;
  BuildContext get context;

  final double _height = 50;

  void setState(dynamic());

  Widget buildButton(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final textColor = button.textColor(context);

    List<Widget> buttonChildren = [];

    if (button.icon != null) {
      final paddedIconWidget = Container(
        margin: EdgeInsets.only(right: theme.distance.spacing.horizontal.small),
        child: button.icon.buildWidget(color: textColor),
      );
      buttonChildren.add(paddedIconWidget);
    }

    final styledButtonText = buildVerticallyCenteredText(
      Text(
        button.text,
        style: theme.typography.button.textStyle(color: textColor),
        textAlign: TextAlign.center,
      ),
    );
    buttonChildren.add(styledButtonText);

    final decoration = BoxDecoration(
      border: Border.all(color: button.strokeColor(context), width: 2),
      color: button.backgroundColor(context),
      borderRadius: BorderRadius.all(theme.radius.medium),
    );

    return buildTappedAwareGestureDetector(
      onTap: () => hapticAction(
        HapticOption.light,
        action: button.onTap,
      ),
      child: Opacity(
        opacity: tapped ? .7 : 1,
        child: Container(
          height: _height,
          decoration: decoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buttonChildren,
          ),
        ),
      ),
    );
  }
}
