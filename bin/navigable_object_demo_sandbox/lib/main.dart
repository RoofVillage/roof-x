import 'package:flutter/material.dart';
import 'package:theme/index.dart';

import 'src/sandbox_artboard.dart';
import 'src/invoice_artboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoofTheme(
      RoofThemeOption.dark,
      child: MaterialApp(
        title: 'Invoice sandbox',
        theme: ThemeData(
          // splashColor: Colors.transparent,
          // highlightColor: Colors.transparent
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // body: SandboxVerticalFullScreenArtboard(),
          body: InvoiceArtboard(),
        ),
      ),
    );
  }
}