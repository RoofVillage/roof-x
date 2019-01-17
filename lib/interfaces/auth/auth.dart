import 'package:flutter/material.dart';

import 'package:roofui_kit/scaffold/index.dart';

import 'package:roof/util/icon_map.dart';
import 'package:roof/util/bloc_provider.dart';

import './widgets/list.dart';
import './bloc/auth_bloc.dart';

// Create a stateful widget
class Auth extends StatelessWidget {
  Widget build(BuildContext context) {
    return RoofUIScaffoldA(
        body: BlocProvider(
          bloc: AuthBloc(),
          child: AuthList(),
        ),
        centerIconReference: CustomIconMap.logoFull,
        rightIconReference: StandardizedIconMap.info);
  }
}
