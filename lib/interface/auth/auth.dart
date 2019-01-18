import 'package:flutter/material.dart';

import 'package:roofui_kit/scaffold/roofui_scaffold_a.dart';
import 'package:roofui_kit/stream/roofui_bloc_provider.dart';

import 'package:roof/util/icon_map.dart';

import './widgets/_list.dart';
import './bloc/_auth_bloc.dart';

// Create a stateful widget
class Auth extends StatelessWidget {
  Widget build(BuildContext context) {
    return RoofUIScaffoldA(
        body: RoofUIBlocProvider(
          bloc: AuthBloc(),
          child: AuthList(),
        ),
        centerIconReference: StandardizedIconMap.logoFull,
        rightIconReference: StandardizedIconMap.info);
  }
}
