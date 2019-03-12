import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';

import 'auxiliary_widget.dart';
import 'button.dart';
import 'field.dart';

class RoofInputDock extends StatefulWidget {
  final DockActionButton dockActionButton;
  final SubmitCallback onSubmit;
  final List<AuxiliaryWidget> auxiliaryWidgets;

  RoofInputDock({this.dockActionButton, this.onSubmit, this.auxiliaryWidgets});

  @override
  State<StatefulWidget> createState() => _RoofInputDockState();
}

class _RoofInputDockState extends State<RoofInputDock>
    with SingleTickerProviderStateMixin {
  final double _baseHeight = 44;
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
      final List<Widget> _auxiliaryWidgets = [];
      for (AuxiliaryWidget auxiliaryWidget in widget.auxiliaryWidgets) {
        _auxiliaryWidgets.add(auxiliaryWidget.buildWithSize(_baseHeight));
      }
      rowChildren.addAll(_auxiliaryWidgets);
    }

    final inputField = DockInputField(
      onInputChange: _doesInputHaveText,
      onSubmit: widget.onSubmit,
      baseHeight: _baseHeight,
    );
    rowChildren.add(inputField);

    if (widget.dockActionButton != null) {
      final actionButton = widget.dockActionButton.buildWithProperties(
        collapse: _inputHasText,
        baseHeight: _baseHeight,
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
