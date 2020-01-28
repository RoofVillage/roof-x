import 'package:flutter/material.dart';
import 'package:sm_theme/index.dart';
import 'package:stream/index.dart';
import 'package:semantic_theme/index.dart';

import 'src/bloc.dart';
import 'src/widget.dart';

void main() {
  runApp(_SustainersMarket());
}

class _SustainersMarket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SemanticTheme(
      themeData: SmSemanticTheme(SmThemeOption.dark),
      child: MaterialApp(
        title: 'Sustainers Market',
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          bloc: AppBloc(),
          child: RootWidget(),
        ),
      ),
    );
  }
}
