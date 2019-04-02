import 'package:flutter/material.dart';
import 'package:stream/index.dart';
import 'package:theme/index.dart';

void main() {
  runApp(Sandbox());
}

class Sandbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoofTheme(
      RoofThemeOption.dark,
      child: MaterialApp(
        title: 'Roof',
        debugShowCheckedModeBanner: false,
        home: BlocProvider(bloc: AppBloc(), child: RootWidget()),
      ),
    );
  }
}
