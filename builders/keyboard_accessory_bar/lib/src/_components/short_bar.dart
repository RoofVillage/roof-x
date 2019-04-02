import 'package:flutter/material.dart';
import 'package:spec/index.dart';

class RoofKeyboardAccessoryShortBar extends StatelessWidget {
  static const _height = RoofDistance.e;

  final List<Widget> children;

  RoofKeyboardAccessoryShortBar({this.children});

  @override
  Widget build(BuildContext context) {
    final row = Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );

    return Container(height: _height, child: row);
  }
}
