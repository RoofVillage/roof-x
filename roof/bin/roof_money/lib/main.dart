import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stream/index.dart';
import 'package:roof_theme/index.dart';
import 'package:semantic_theme/index.dart';

import 'src/bloc.dart';
import 'src/widget.dart';

void main() {
  runApp(_RoofMoney());
}

class _RoofMoney extends StatelessWidget {
  final initialThemeData = RoofSemanticTheme(RoofThemeOption.light);

  @override
  Widget build(BuildContext context) {
    return SemanticTheme(
      themeData: initialThemeData,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: initialThemeData.systemUiStyle.systemUiOverlayStyle.value,
        child: MaterialApp(
          title: 'Roof Money',
          debugShowCheckedModeBanner: false,
          home: BlocProvider(
            bloc: AppBloc(),
            child: RootWidget(),
          ),
        ),
      ),
    );
  }
}
