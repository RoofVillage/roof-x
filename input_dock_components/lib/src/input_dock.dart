import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';

import 'widgets/index.dart';
import 'dock_data.dart';

class RoofInputDock extends StatefulWidget {
  final DockActionButton actionButton;
  final DockDataCallback onSubmit;
  final List<AuxiliaryWidget> auxiliaryWidgets;

  RoofInputDock({this.actionButton, this.onSubmit, this.auxiliaryWidgets});

  @override
  State<StatefulWidget> createState() => _RoofInputDockState();
}

class _RoofInputDockState extends State<RoofInputDock> {
  static const double _baseHeight = 40;

  bool _collapseButton = false;
  DockSubmitData _dockData = DockSubmitData();

  void _shouldButtonCollapse(bool val) {
    if (val != _collapseButton) {
      setState(() {
        _collapseButton = val;
      });
    }
  }

  void _fieldSubmit(String text) {
    _dockData.setText(text);
    widget.onSubmit(data: _dockData);
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    List<Widget> rowChildren = [];

    if (widget.auxiliaryWidgets != null && widget.auxiliaryWidgets.isNotEmpty) {
      final List<Widget> _auxiliaryWidgets = [];
      for (AuxiliaryWidget auxWidget in widget.auxiliaryWidgets) {
        _auxiliaryWidgets.add(
          auxWidget.buildForDock(baseHeight: _baseHeight, dockData: _dockData),
        );
      }
      rowChildren.addAll(_auxiliaryWidgets);
    }

    final inputField = DockInputField(
      onInputChange: _shouldButtonCollapse,
      onSubmit: _fieldSubmit,
      baseHeight: _baseHeight,
    );
    rowChildren.add(inputField);

    if (widget.actionButton != null) {
      final actionButton = widget.actionButton.buildWithProperties(
        collapse: _collapseButton,
        baseHeight: _baseHeight,
      );
      rowChildren.add(actionButton);
    }

    final Widget fieldRow = Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: rowChildren,
    );

    if (_dockData.getFiles().isNotEmpty) {
      final Widget filePreviews = FilePreviewContainer(
        files: _dockData.getFiles(),
        removeFile: _dockData.removeFile,
      );
    }

    return SafeArea(
      top: false,
      left: false,
      right: false,
      child: Container(
        color: theme.color.background.brandPrimary,
        padding: RoofObjectPadding.container1,
        child: fieldRow,
      ),
    );
  }
}
