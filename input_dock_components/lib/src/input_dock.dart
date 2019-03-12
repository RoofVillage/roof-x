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

class _RoofInputDockState extends State<RoofInputDock> {
  static const double _baseHeight = 40;
  bool _collapseButton = false;

  void _shouldButtonCollapse(bool val) {
    if (val != _collapseButton) {
      setState(() {
        _collapseButton = val;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    List<Widget> rowChildren = [];

    if (widget.auxiliaryWidgets != null && widget.auxiliaryWidgets.isNotEmpty) {
      final List<Widget> _auxiliaryWidgets = [];
      for (AuxiliaryWidget auxWidget in widget.auxiliaryWidgets) {
        _auxiliaryWidgets.add(
          auxWidget.buildWithSize(_baseHeight),
        );
      }
      rowChildren.addAll(_auxiliaryWidgets);
    }

    final inputField = DockInputField(
      onInputChange: _shouldButtonCollapse,
      onSubmit: widget.onSubmit,
      baseHeight: _baseHeight,
    );
    rowChildren.add(inputField);

    if (widget.dockActionButton != null) {
      final actionButton = widget.dockActionButton.buildWithProperties(
        collapse: _collapseButton,
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
