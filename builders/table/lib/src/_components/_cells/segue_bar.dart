import 'package:flutter/material.dart';
import 'package:distance/index.dart' as distance;
import 'package:theme/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:icon_library/index.dart';
import 'package:haptics/index.dart';

class RoofSegueBar extends StatelessWidget {
  final String title;
  final StandardIconReference iconReference;
  final String auxiliaryText;
  final VoidCallback onTap;

  RoofSegueBar({
    @required this.title,
    @required this.iconReference,
    this.auxiliaryText,
    @required this.onTap,
  });

  final _horizontalPadding = distance.b;
  final _verticalPadding = distance.c;
  final _horizontalSpacing = distance.b;

  final _titleTypographyStyle = typography.bodyPrimaryThick;

  final _tapHapticOption = HapticOption.light;

  void _fireHaptic() {
    if (onTap != null) triggerHapticWith(_tapHapticOption);
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final iconWidget = iconReference.buildWidget(
      color: theme.color.icon.nav,
    );

    final titleTextStyle = _titleTypographyStyle.textStyleWithColor(
      theme.color.text.primary,
    );

    final paddedTitleWidget = Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: _horizontalPadding),
        child: Text(title, style: titleTextStyle),
      ),
    );

    List<Widget> rowChildren = [
      iconWidget,
      paddedTitleWidget,
    ];

    if (auxiliaryText != null) {
      final auxiliaryTextWidget = _AuxiliaryTextWidget(
        text: auxiliaryText,
        leftMargin: _horizontalSpacing,
      );

      rowChildren.add(auxiliaryTextWidget);
    }

    return GestureDetector(
      onTapDown: (details) => _fireHaptic(),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: _horizontalPadding, vertical: _verticalPadding),
        child: Row(
          children: rowChildren,
        ),
      ),
    );
  }
}

class _AuxiliaryTextWidget extends StatelessWidget {
  final String text;
  final double leftMargin;

  _AuxiliaryTextWidget({
    @required this.text,
    @required this.leftMargin,
  });

  final _typographyStyle = typography.bodyPrimaryThick;

  final _padding = distance.b;

  final double _height = 40;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final double borderRadius = _height / 2;

    final textStyle = _typographyStyle.textStyleWithColor(
      theme.color.text.secondaryAction,
    );

    final textWidget = Text(
      text,
      style: textStyle,
    );

    return Container(
      height: _height,
      margin: EdgeInsets.only(left: leftMargin),
      padding: EdgeInsets.symmetric(horizontal: _padding),
      decoration: BoxDecoration(
        color: theme.color.background.generalPrimary,
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ),
      child: Center(
        child: textWidget,
      ),
    );
  }
}
