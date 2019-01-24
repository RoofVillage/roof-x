import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:stream/index.dart';

import '_bloc.dart';
import '_widget.dart';

class SignUp extends StatelessWidget {
  Widget build(BuildContext context) {
    ///change to button sheet scaffold.
    return RoofScaffoldA(
        body: BlocProvider(
      bloc: Bloc(),
      child: RootWidget(),
    ));
  }
}
