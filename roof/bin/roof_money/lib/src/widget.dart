import 'package:commands/index.dart';
import 'package:flutter/services.dart';
import 'package:semantic_theme/index.dart';
import 'package:wallet_dashboard_artboard/index.dart';
import 'package:flutter/material.dart';
import 'package:stream/index.dart';
import 'package:artboard/index.dart';
import 'package:vertical_full_screen_artboard_scaffold/index.dart';
import 'package:device_screen/index.dart';
import 'package:domains_artboard/index.dart';

import 'bloc.dart';
import 'data/index.dart';

class RootWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    final AppBloc tableBloc = BlocProvider.of<AppBloc>(context);
    final stream = StreamBuilder<StreamableAppStateData>(
      stream: tableBloc.outAppState,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();
        final appState = snapshot.data;

        SessionCommands(context).start();

        Artboard startingArtboard;
        if (appState.isInSession) {
          startingArtboard = DomainsVerticalFullscreenArtboard();
          // startingArtboard =
          //     WalletDashboardVerticalFullscreenArtboard('Mills Rentals');
        } else {
          startingArtboard = DomainsVerticalFullscreenArtboard();
        }

        return VerticalFullScreenArtboardNavigator(
          artboard: startingArtboard,
        );
      },
    );
    return DeviceScreen(child: stream);
  }
}
