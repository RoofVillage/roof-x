import 'package:flutter/material.dart';
import 'package:roof/util/icon_map.dart';
import 'package:roofui_kit/scaffold/index.dart';

import 'widgets/list.dart';

// Create a stateful widget
class Auth extends StatelessWidget {
  Widget build(BuildContext context) {
    return RoofUIScaffoldA(
        body: AuthList(),
        centerIconReference: CustomIconMap.logoFull,
        leftIconReference: StandardizedIconMap.cashSack,
        rightIconReference: StandardizedIconMap.cashSack);
  }
}
