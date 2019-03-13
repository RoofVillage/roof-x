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
  _inputSubmitAction(DockFieldSubmitData data) {
    print("input text: ${data.text}");
  }

  _threadAction() {
    print("thread action");
  }

  final _actionIcon = IconReference.restock;

  @override
  Widget build(BuildContext context) {
    final theme =RoofTheme.of(context);

    final auxiliaryWidgets = [
      AuxiliaryWidget(
        iconReference: IconReference.addImage,
        action: () => print("auxiliary action"),
      ),
      // AuxiliaryWidget(
      //   iconReference: IconReference.camera,
      //   action: () => print("auxiliary action"),
      // )
    ];

    final inputButton = DockActionButton(
      action: _threadAction,
      actionTitle: "Restock",
      actionIconReference: _actionIcon,
    );

    final dock = RoofInputDock(
      auxiliaryWidgets: auxiliaryWidgets,
      dockActionButton: inputButton,
      onSubmit: _inputSubmitAction,
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              color: theme.color.background.general,
            ),
          ),
          dock,
        ],
      ),
    );
  }
}
