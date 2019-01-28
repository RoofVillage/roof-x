import 'package:flutter/material.dart';
import 'package:stream/index.dart';

import 'src/_bloc.dart';
import 'src/_widget.dart';

void main() {
  // runApp(_Roof());
  runApp(_Roof());
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
