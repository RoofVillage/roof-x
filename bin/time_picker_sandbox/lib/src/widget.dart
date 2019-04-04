import 'package:flutter/material.dart';
import 'package:stream/index.dart';
import 'package:artboard/index.dart';
import 'package:public_activity_artboard/index.dart';
import 'package:full_screen_artboard_templates/index.dart';
import 'package:theme/index.dart';
import 'package:time_picker_builder/index.dart';

import 'bloc.dart';
import 'data/index.dart';

class RootWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final AppBloc tableBloc = BlocProvider.of<AppBloc>(context);

    return StreamBuilder<StreamableAppStateData>(
      stream: tableBloc.outAppState,
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: theme.color.background.general,
          body: Center(
              child: TimePicker(
            initialValue: TimeOfDay.now(),
          )),
        );
      },
    );
  }
}
