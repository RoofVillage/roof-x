import 'package:flutter/material.dart';
import 'package:stream/index.dart';
import 'package:theme/index.dart';
import 'package:button_row_dock_builder/index.dart';

import 'bloc.dart';
import 'data/index.dart';

class RootWidget extends StatelessWidget with ButtonDockBuilder {
  List<Widget> get dockButtons => [];

  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final AppBloc tableBloc = BlocProvider.of<AppBloc>(context);

    final buttonDock = buildButtonDock(context);

    return StreamBuilder<StreamableAppStateData>(
      stream: tableBloc.outAppState,
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: theme.color.background.general,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [buttonDock],
          ),
        );
      },
    );
  }
}
