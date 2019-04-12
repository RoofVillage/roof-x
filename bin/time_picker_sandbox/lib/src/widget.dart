import 'package:flutter/material.dart';
import 'package:stream/index.dart';
import 'package:vertical_full_screen_artboard_scaffold/index.dart';
import 'package:theme/index.dart';
import 'package:time_picker_builder/index.dart';

import 'bloc.dart';
import 'data/index.dart';

class RootWidget extends StatelessWidget with TimePickerBuilder {
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final AppBloc tableBloc = BlocProvider.of<AppBloc>(context);

    final timePicker = buildTimePicker(context);

    return StreamBuilder<StreamableAppStateData>(
      stream: tableBloc.outAppState,
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: theme.color.background.general,
          body: Center(
            child: timePicker,
          ),
        );
      },
    );
  }
}
