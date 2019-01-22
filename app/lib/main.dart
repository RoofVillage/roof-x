import 'package:flutter/material.dart';
import 'package:stream/index.dart';

import '_bloc.dart';
import '_root.dart';

void main() {
  runApp(MaterialApp(
    title: 'Roof',
    theme: ThemeData(fontFamily: 'Azo'),
    home: BlocProvider(
      bloc: AppBloc(),
      child: Root(),
    ),
  ));
}
