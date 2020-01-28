import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'dart:ui';

import 'src/invoice_artboard.dart';
import 'src/lease_artboard.dart';
import 'src/property_artboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoofTheme(
      RoofThemeOption.dark,
      child: MaterialApp(
        title: 'Invoice sandbox',
        theme: ThemeData(
          // TODO new method of overwriting splash/highlight color, necessary for removing inkwell animation on tab bars
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // body: InvoiceArtboard(),
          // body: LeaseArtboard(),
          body: PropertyArtboard(),
        ),
      ),
    );
  }
}