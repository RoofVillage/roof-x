import 'package:flutter/material.dart';

import 'index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Container(color: Colors.white, child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget with SpacedGridBuilder {
  @override
  Widget build(BuildContext context) {
    return Center(child: buildSpacedGrid(context));
  }
}
