import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multi_image_picker/asset.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';

import 'widgets/index.dart';
import 'data.dart';

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
  List<Asset> _files = [];

  void _setText(String text) {
    setState(() {
      _text = text;
    });
  }

  void _addFiles(List<Asset> files) {
    setState(() {
      _files.addAll(files);
    });
  }

  void _removeFile(Asset file) {
    setState(() {
      _files.remove(file);
    });
  }

  void _submit() {
    _showDialogDev();

    // Format data and make API call
    final data = DockSubmitData(
      text: _text,
      // files: _files,
    );
    widget.onSubmit(data: data);

    _resetDock();
  }

  void _resetDock() {
    setState(() {
      _files = [];
      _text = "";
    });
  }

  void _showDialogDev() {
    String displayText = "";
    if (_text.isNotEmpty) {
      displayText += "\nText: " + _text;
    }
    if (_files.isNotEmpty) {
      displayText += "\nFiles: " + _files.length.toString();
    }
    showDialog(
      builder: (context) => AlertDialog(
            title: Text("submit:"),
            content: Text(displayText),
          ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    final RoofInheritedTheme theme = RoofTheme.of(context);

    final List<Widget> columnChildren = [];

    columnChildren.add(FilePreviewContainer());

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

    final safeArea = MediaQuery.of(context).padding.bottom;
    final padding = EdgeInsets.only(bottom: safeArea);

    final Widget dock = Container(
      padding: padding,
      color: theme.color.background.brandPrimary,
      child: Column(
        children: columnChildren,
      ),
    );

    return InheritedInputDock(
      child: dock,
      setText: _setText,
      addFiles: _addFiles,
      removeFile: _removeFile,
      onSubmit: _submit,
      baseHeight: _baseHeight,
      showSubmitButton: (_text.isNotEmpty || _files.isNotEmpty),
      files: _files,
    );
  }
}

class InheritedInputDock extends InheritedWidget {
  final Function(String) setText;
  final Function(List<Asset>) addFiles;
  final Function(Asset) removeFile;
  final VoidCallback onSubmit;
  final double baseHeight;
  final bool showSubmitButton;
  final List<Asset> files;

  final double previewHeight = 120;
  final double previewWidth = 160;

  InheritedInputDock({
    Key key,
    @required Widget child,
    @required this.setText,
    @required this.addFiles,
    @required this.removeFile,
    @required this.onSubmit,
    this.showSubmitButton,
    this.baseHeight,
    this.files,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
