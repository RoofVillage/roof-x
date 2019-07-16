import 'package:flutter/material.dart';
import 'package:titled_option_data/index.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart' as typography;

class RollerColumnBody<T> extends StatelessWidget {
  /// Builds a column of widgets from a [list] of int values repeated three times to allow simulated infinite scrolling, with the [selectedValue] highlighted.

  final TitledOptionData<T> selectedValue;
  final List<TitledOptionData<T>> list;
  final bool canRollover;
  final CrossAxisAlignment crossAxisAlignment;

  RollerColumnBody({
    @required this.selectedValue,
    @required this.list,
    this.crossAxisAlignment,
    canRollover,
  }) : this.canRollover = canRollover ?? false;

  final _inactiveTypography = typography.body;
  final _activeTypography = typography.bodyThick;
  final double _stepHeight = 40;

  @override
  Widget build(BuildContext context) {
    final activeTextColor = RoofTheme.of(context).color.text.primary;
    final inactiveTextColor = RoofTheme.of(context).color.text.secondary;
    final activeStyle = _activeTypography.textStyleWithColor(activeTextColor);
    final inactiveStyle =
        _inactiveTypography.textStyleWithColor(inactiveTextColor);

    final widgetsLength = list.length * (canRollover ? 3 : 1);

    List<Widget> widgets = [];

    for (var i = 0; i < widgetsLength; i++) {
      final j = i % list.length;

      final style = (list[j].data == selectedValue.data) ? activeStyle : inactiveStyle;

      widgets.add(
        Container(
          height: _stepHeight,
          child: Text(
            list[j].title,
            textAlign: TextAlign.end,
            style: style,
          ),
        ),
      );
    }

    return Container(
      height: widgets.length * _stepHeight,
      child: Column(
        children: widgets,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      ),
    );
  }
}
