import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';

import 'button.dart';
import 'field.dart';

class RoofInputDock extends StatefulWidget {
  final DockActionButton dockActionButton;
  final List<Widget> auxiliaryWidgets;

  RoofInputDock({this.dockActionButton, this.auxiliaryWidgets});

  @override
  State<StatefulWidget> createState() => _RoofInputDockState();
}

class _RoofInputDockState extends State<RoofInputDock>
    with SingleTickerProviderStateMixin {
  bool _inputHasText = false;

  void doesInputHaveText(bool val) {
    if (val != _inputHasText) {
      setState(() {
        _inputHasText = val;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    List<Widget> rowChildren = [];

    if (widget.auxiliaryWidgets != null && widget.auxiliaryWidgets.isNotEmpty) {
      rowChildren.addAll(widget.auxiliaryWidgets);
    }

    final commentBox =
        DockInputField(inputHasText: (bool val) => doesInputHaveText(val));
    rowChildren.add(commentBox);

    if (widget.dockActionButton != null) {
      rowChildren.add(widget.dockActionButton.build(shrink: _inputHasText));
    }

    final Widget contentRow = Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: rowChildren,
    );

    return SafeArea(
        top: false,
        left: false,
        right: false,
        child: Container(
          color: theme.color.background.brandPrimary,
          padding: RoofObjectPadding.container1,
          child: contentRow,
        ));
  }
}
