import 'package:flutter/material.dart';
import 'package:spec/index.dart';

class KeyboardAccessoryShortBar extends StatelessWidget {
  static const _height = RoofDistance.e;

  final List<Widget> children;

  KeyboardAccessoryShortBar({this.children});

  @override
  Widget build(BuildContext context) {
    final row = Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );

    return Container(height: _height, child: row);
  }
}
