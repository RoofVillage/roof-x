import 'package:flutter/material.dart';
import 'package:stream/index.dart';
import 'package:roof_theme/index.dart';

import 'src/bloc.dart';
import 'src/widget.dart';

void main() {
  runApp(_Roof());
}

class _Roof extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoofSemanticTheme(
      RoofThemeOption.dark,
      child: MaterialApp(
        title: 'Roof',
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          bloc: AppBloc(),
          child: RootWidget(),
        ),
      ),
    );
  }
}
