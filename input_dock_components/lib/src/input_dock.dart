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

  static InheritedInputDock of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(InheritedInputDock);
  }

  @override
  State<StatefulWidget> createState() => _RoofInputDockState();
}

class _RoofInputDockState extends State<RoofInputDock> {
  static const double _baseHeight = 40;

  String _text = "";
  List<String> _files = [];

  void _setText(String text) {
    setState(() {
      _text = text;
    });
  }

  void _addFile(String file) {
    setState(() {
      _files.add(file);
    });
  }

  void _removeFile(String file) {
    setState(() {
      _files.remove(file);
    });
  }

  void _submit() {
    final data = DockSubmitData(
      text: _text,
      files: _files,
    );
    widget.onSubmit(data: data);
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final hasData = _text.isNotEmpty || _files.isNotEmpty;

    List<Widget> rowChildren = [];

    if (widget.auxiliaryWidgets != null) {
      rowChildren.addAll(widget.auxiliaryWidgets);
    }

    rowChildren.add(DockInputField());

    if (widget.actionButton != null) {
      rowChildren.add(widget.actionButton);
    }

    final Widget fieldRow = Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: rowChildren,
    );

    final List<Widget> columnChildren = [];

    if (_files.isNotEmpty) {
      final Widget filePreviews = FilePreviewContainer(
        files: _files,
        removeFile: _removeFile,
      );
      columnChildren.add(filePreviews);
    }

    columnChildren.add(fieldRow);

    final Widget dock = SafeArea(
      top: false,
      left: false,
      right: false,
      child: Container(
        color: theme.color.background.brandPrimary,
        padding: RoofObjectPadding.container1,
        child: Column(
          children: columnChildren,
        ),
      ),
    );

    return InheritedInputDock(
      child: dock,
      setText: _setText,
      addFile: _addFile,
      onSubmit: _submit,
      baseHeight: _baseHeight,
      showSubmitButton: hasData,
    );
  }
}

class InheritedInputDock extends InheritedWidget {
  final Function(String) setText;
  final Function(String) addFile;
  final VoidCallback onSubmit;
  final double baseHeight;
  final bool showSubmitButton;

  InheritedInputDock({
    Key key,
    @required Widget child,
    @required this.setText,
    @required this.addFile,
    @required this.onSubmit,
    this.showSubmitButton,
    this.baseHeight,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
