import 'package:flutter/material.dart';

import 'package:spec/scaffolds/a/index.dart';
import 'package:stream/bloc_provider.dart';

import 'package:icon_library/index.dart';

import '_bloc.dart';
import '_root.dart';

// Create a stateful widget
class PublicActivity extends StatelessWidget {
  Widget build(BuildContext context) {
    return RoofScaffoldA(
        body: BlocProvider(
          bloc: Bloc(),
          child: Root(),
        ),
        centerIconReference: IconReference.logoFull,
        rightIconReference: IconReference.info);
  }
}
