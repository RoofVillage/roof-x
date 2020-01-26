import 'package:flutter/material.dart';
import '_components/short_bar.dart';

mixin KeyboardAccessoryBarBuilder {
  RoofKeyboardAccessoryShortBar buildKeybordAccessoryShortBar(
    BuildContext context, {
    @required List<Widget> children,
  }) {
    return RoofKeyboardAccessoryShortBar(children: children);
  }
}
