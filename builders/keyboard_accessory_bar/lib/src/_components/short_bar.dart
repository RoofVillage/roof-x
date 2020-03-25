import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class KeyboardAccessoryShortBar extends StatelessWidget {
  final List<Widget> children;

  KeyboardAccessoryShortBar({this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: children),
    );
  }
}
