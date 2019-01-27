import 'package:flutter/material.dart';
import 'package:stream/index.dart';
import 'sandbox.dart';
import 'package:spec/theme/index.dart';

import '_bloc.dart';
import '_widget.dart';

void main() {
  // runApp(_Roof());
  runApp(_Roof());
}

class _Sandbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Roof',
        theme: ThemeData(fontFamily: 'Azo'),
        home: RoofTheme(RoofThemeOption.dark, child: Sandbox()));
  }
}

class _Roof extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roof',
      theme: ThemeData(fontFamily: 'Azo'),
      home: BlocProvider(
        bloc: AppBloc(),
        child: RootWidget(),
      ),
    );
  }
}
