import 'package:flutter/material.dart';
import '_components/short_bar.dart';

mixin KeyboardAccessoryBarBuilder {
  KeyboardAccessoryShortBar buildKeybordAccessoryShortBar(
    BuildContext context, {
    @required List<Widget> children,
  }) {
    return KeyboardAccessoryShortBar(children: children);
  }
}
