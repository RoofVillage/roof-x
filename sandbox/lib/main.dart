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
  @override
  Widget build(BuildContext context) {
    _threadAction() {
      print("thread action");
    }

    final actionIcon = IconReference.outOfStock;
    final inputButton = DockActionButton(
      action: _threadAction,
      actionTitle: "Action!",
      actionIconReference: actionIcon,
    );

    final dock = RoofInputDock(dockActionButton: inputButton);

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
