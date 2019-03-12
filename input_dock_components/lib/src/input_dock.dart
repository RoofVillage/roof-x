import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';

import 'button.dart';
import 'field.dart';

class RoofInputDock extends StatefulWidget {
  final DockActionButton dockActionButton;
  final SubmitCallback onSubmit;
  final List<Widget> auxiliaryWidgets;

  RoofInputDock({this.dockActionButton, this.onSubmit, this.auxiliaryWidgets});

  @override
  State<StatefulWidget> createState() => _RoofInputDockState();
}

class _RoofInputDockState extends State<RoofInputDock>
    with SingleTickerProviderStateMixin {
  bool _inputHasText = false;

  void _doesInputHaveText(bool val) {
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

    final inputField = DockInputField(
      onInputChange: _doesInputHaveText,
      onSubmit: widget.onSubmit,
    );
    rowChildren.add(inputField);

    if (widget.dockActionButton != null) {
      final actionButton = widget.dockActionButton.buildWithCallback(
        collapse: _inputHasText,
      );
      rowChildren.add(actionButton);
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
      ),
    );
  }
}
