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

  final _actionIcon = IconReference.outOfStock;

  @override
  Widget build(BuildContext context) {
    final inputButton = DockActionButton(
      action: _threadAction,
      actionTitle: "Action!",
      actionIconReference: _actionIcon,
    );

    final dock = RoofInputDock(
      dockActionButton: inputButton,
      onSubmit: _inputSubmitAction,
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            child: dock,
          )
        ],
      ),
    );
  }
}
