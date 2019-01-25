import 'package:flutter/material.dart';
import 'package:stream/index.dart';
import 'package:spec/theme/index.dart';

import './artboards/public_activity/index.dart';

import '_bloc.dart';
import 'data/index.dart';

class RootWidget extends StatelessWidget {
  final RoofThemeOption theme;

  RootWidget({this.theme = RoofThemeOption.dark});

  Widget build(BuildContext context) {
    return RoofTheme(theme, child: _Artboard());
  }
}

class _Artboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppBloc tableBloc = BlocProvider.of<AppBloc>(context);
    return StreamBuilder<StreamableAppStateData>(
        stream: tableBloc.outAppState,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();
          final appState = snapshot.data;

          if (appState.isInSession) {
            return PublicActivity();
          } else {
            return PublicActivity();
          }
        });
  }
}
