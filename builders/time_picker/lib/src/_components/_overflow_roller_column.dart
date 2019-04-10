import 'package:flutter/material.dart';
import 'package:typography/index.dart' as typography;
import 'package:theme/index.dart';

class OverflowRollerColumn extends StatelessWidget {
  /// Builds a column of widgets from a [list] of int values repeated three times, with the [selectedValue] highlighted. [stepHeight] is the height of each widget. [textMask] should accept `list[i]` value and return a string to be displayed in the corresponding widget. Use [adjustValue()] to perform calculations on the [selectedValue] value before comparing it to `list[i]` to determine which value is active.

  final int selectedValue;
  final List<int> list;
  final double stepHeight;
  final Function(List<int>, int) textMask;
  final Function(int) adjustValue;

  OverflowRollerColumn({
    @required this.selectedValue,
    @required this.list,
    @required this.stepHeight,
    this.textMask,
    this.adjustValue,
  });

  final _inactiveTypography = typography.bodyPrimary;
  final _activeTypography = typography.bodyPrimaryThick;

  @override
  Widget build(BuildContext context) {
    final activeTextColor = RoofTheme.of(context).color.text.primary;
    final inactiveTextColor = RoofTheme.of(context).color.text.secondary;
    final activeStyle = _activeTypography.textStyleWithColor(activeTextColor);
    final inactiveStyle =
        _inactiveTypography.textStyleWithColor(inactiveTextColor);

    final widgetsLength = list.length * 3;

    List<Widget> widgets = [];

    for (var i = 0; i < widgetsLength; i++) {
      final displayText = textMask != null
          ? textMask(list, i % list.length)
          : list[i].toString();

      int adjustedValue =
          (adjustValue != null) ? adjustValue(selectedValue) : selectedValue;

      final style = (i % list.length == list.indexOf(adjustedValue))
          ? activeStyle
          : inactiveStyle;

      widgets.add(
        Container(
          height: stepHeight != null ? stepHeight : 40,
          child: Center(
            child: Text(
              displayText,
              style: style,
            ),
          ),
        ),
      );
    }

    return Container(
      height: widgets.length * stepHeight,
      child: Column(children: widgets),
    );
  }
}
