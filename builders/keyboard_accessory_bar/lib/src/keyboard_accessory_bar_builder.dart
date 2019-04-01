import 'package:flutter/material.dart';
import 'components/index.dart';

mixin KeyboardAccessoryBarBuilder {
  RoofKeyboardAccessoryShortBar buildKeybordAccessoryShortBar(
      BuildContext context,
      {@required List<Widget> children}) {
    return RoofKeyboardAccessoryShortBar(children: children);
  }
}
