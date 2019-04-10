import 'package:flutter/material.dart';
import 'package:artboard/index.dart';

import 'src/navigation/navigator.dart';
import 'src/horizontal_floating_artboard.dart';

void main() {
  runApp(_Roof());
}

class _Roof extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Artboard startingArtboard = _DemoArtboard();

    return HorizontalFloatingArtboardNavigator(artboard: startingArtboard);
  }
}

class _DemoArtboard extends HorizontalFloatingArtboard {
  @override
  State<StatefulWidget> createState() => _DemoArtboardState();
}

class _DemoArtboardState extends State<_DemoArtboard> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue, width: 400);
  }
}
