import 'dart:io';

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
  List<File> _previews = [];

  void _setText(String text) {
    setState(() {
      _text = text;
    });
  }

  void _addFile(File file) {
    setState(() {
      _previews.add(file);
    });
  }

  void _removeFile(File file) {
    setState(() {
      _previews.remove(file);
    });
  }

  void _submit() {
    final data = DockSubmitData(
      text: _text,
      // files: _files,
    );
    widget.onSubmit(data: data);
  }

  @override
  Widget build(BuildContext context) {
    final RoofInheritedTheme theme = RoofTheme.of(context);

    final bool hasData = _text.isNotEmpty || _previews.isNotEmpty;

    final List<Widget> columnChildren = [];

    final Widget filePreviews = FilePreviewContainer();
    columnChildren.add(filePreviews);

    List<Widget> rowChildren = [];

    if (widget.auxiliaryWidgets != null) {
      rowChildren.addAll(widget.auxiliaryWidgets);
    }

    rowChildren.add(DockInputField());

    if (widget.actionButton != null) {
      rowChildren.add(widget.actionButton);
    }

    final Widget fieldRow = Container(
      padding: RoofObjectPadding.container1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: rowChildren,
      ),
    );
    columnChildren.add(fieldRow);

    final Widget dock = SafeArea(
      top: false,
      left: false,
      right: false,
      child: Container(
        color: theme.color.background.brandPrimary,
        child: Column(
          children: columnChildren,
        ),
      ),
    );

    return InheritedInputDock(
      child: dock,
      setText: _setText,
      addFile: _addFile,
      removeFile: _removeFile,
      onSubmit: _submit,
      baseHeight: _baseHeight,
      showSubmitButton: hasData,
      previews: _previews,
    );
  }
}

class InheritedInputDock extends InheritedWidget {
  final Function(String) setText;
  final Function(File) addFile;
  final Function(File) removeFile;
  final VoidCallback onSubmit;
  final double baseHeight;
  final bool showSubmitButton;
  final List<File> previews;

  InheritedInputDock({
    Key key,
    @required Widget child,
    @required this.setText,
    @required this.addFile,
    @required this.removeFile,
    @required this.onSubmit,
    this.showSubmitButton,
    this.baseHeight,
    this.previews,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
