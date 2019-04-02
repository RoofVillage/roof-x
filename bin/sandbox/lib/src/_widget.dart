import 'package:flutter/material.dart';
import 'package:stream/index.dart';
import 'package:full_screen_artboard_templates/index.dart';

import 'data/index.dart';

class RootWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    final AppBloc tableBloc = BlocProvider.of<AppBloc>(context);
    return StreamBuilder<StreamableAppStateData>(
      stream: tableBloc.outAppState,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();
        final appState = snapshot.data;

        Artboard startingArtboard;
        if (appState.isInSession) {
          startingArtboard = FieldsTestingArtboard();
        } else {
          startingArtboard = FieldsTestingArtboard();
        }

        return FullScreenArtboardNavigator(artboard: startingArtboard);
      },
    );
  }
}
