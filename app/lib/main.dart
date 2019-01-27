import 'package:flutter/material.dart';
import 'package:stream/index.dart';
import 'sandbox.dart';

import '_bloc.dart';
import '_widget.dart';

void main() {
  // runApp(_Roof());
  runApp(_Sandbox());
}

class _Sandbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roof',
      theme: ThemeData(fontFamily: 'Azo'),
      home: Sandbox()
    );
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
