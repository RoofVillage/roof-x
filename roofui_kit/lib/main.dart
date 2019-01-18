import 'package:flutter/material.dart';
import 'scaffold/roofui_scaffold_a.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Roof UI Kit',
    theme: ThemeData(fontFamily: 'Azo'),
    home: RoofUIScaffoldA(body: Container()),
  ));
}
