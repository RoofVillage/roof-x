import 'package:flutter/material.dart';
import 'package:multi_image_picker/asset.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';

import '_file_preview.dart';
import '_input_field.dart';

class DockSubmitData {
  String text;
  List<String> files;

  DockSubmitData({this.text, this.files});
}

typedef DockDataHandler = void Function(DockSubmitData data);

class RoofInputDock extends StatefulWidget {
  final Widget actionButton;
  final DockDataHandler onSubmit;
  final List<Widget> auxiliaryWidgets;

  RoofInputDock({this.actionButton, this.onSubmit, this.auxiliaryWidgets});

  @override
  State<StatefulWidget> createState() => InheritedInputDock();

  static InheritedInputDock of(BuildContext context,
      {bool shouldRebuild = true}) {
    final inheritedWidget = (shouldRebuild
        ? context.inheritFromWidgetOfExactType(_InheritedInputDock)
        : context.ancestorWidgetOfExactType(_InheritedInputDock));

    return (inheritedWidget as _InheritedInputDock).data;
  }
}

class InheritedInputDock extends State<RoofInputDock> {
  final double baseHeight = 40;
  final double previewHeight = 120;
  final double previewWidth = 160;

  String _text = '';
  List<Asset> files = [];

  bool get showSubmitButton => _text.isNotEmpty || files.isNotEmpty;
  set text(String text) => setState(() => _text = text);

  void addFiles(List<Asset> files) => setState(() => files.addAll(files));
  void removeFile(Asset file) => setState(() => files.remove(file));

  void onSubmit() {
    _showDialogDev();

    // Format data and make API call
    final data = DockSubmitData(
      text: _text,
      // files: _files,
    );
    widget.onSubmit(data);

    _resetDock();
  }

  void _resetDock() {
    setState(() {
      files = [];
      _text = "";
    });
  }

  void _showDialogDev() {
    String displayText = "";
    if (_text.isNotEmpty) {
      displayText += "\nText: " + _text;
    }
    if (files.isNotEmpty) {
      displayText += "\nFiles: " + files.length.toString();
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

    final columnChildren = <Widget>[];

    columnChildren.add(DockFilePreview());

    final rowChildren = <Widget>[];

    if (widget.auxiliaryWidgets != null) {
      rowChildren.addAll(widget.auxiliaryWidgets);
    }

    rowChildren.add(DockInputField(onSubmit: onSubmit));

    if (widget.actionButton != null) rowChildren.add(widget.actionButton);

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

    return _InheritedInputDock(data: this, child: dock);
  }
}

class _InheritedInputDock extends InheritedWidget {
  final InheritedInputDock data;

  _InheritedInputDock({@required this.data, @required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(_InheritedInputDock old) => true;
}
