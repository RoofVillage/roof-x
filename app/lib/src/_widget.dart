import 'package:flutter/material.dart';
import 'package:stream/index.dart';
import 'package:artboard/index.dart';
import 'package:artboard_navigators/index.dart';
import 'package:auth_artboards/index.dart';

import '_bloc.dart';
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
            startingArtboard = PublicActivityArtboard();
          } else {
            startingArtboard = PublicActivityArtboard();
          }

          return FullScreenArtboardNavigator(artboard: startingArtboard);
        });
  }
}
