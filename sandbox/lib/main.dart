import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:input_dock_components/index.dart';
import 'package:icon_library/index.dart';

void main() {
  runApp(Sandbox());
}

class Sandbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoofTheme(
      RoofThemeOption.dark,
      child: MaterialApp(
        title: 'Roof',
        theme: ThemeData(fontFamily: 'azo'),
        home: Thread(),
      ),
    );
  }
}

class Thread extends StatelessWidget {
  _threadAction() {
    print("thread action: $_actionText");
  }

  final _actionIcon = IconReference.restock;
  final _actionText = "Restock";

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final auxiliaryWidgets = [
      CameraAuxiliaryWidget(),
      AddFileAuxiliaryWidget(),
    ];

    final actionButton = DockActionButton(
      action: _threadAction,
      actionTitle: _actionText,
      actionIconReference: _actionIcon,
    );

    _inputSubmitAction({DockSubmitData data}) {
      final text = data.text;
      final files = data.files;
    }

    final inputDock = RoofInputDock(
      auxiliaryWidgets: auxiliaryWidgets,
      actionButton: actionButton,
      onSubmit: _inputSubmitAction,
    );

    return Scaffold(
      backgroundColor: theme.color.background.general,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          inputDock,
        ],
      ),
    );
  }
}
