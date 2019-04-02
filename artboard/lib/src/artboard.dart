import 'dart:async';

import 'package:flutter/material.dart';

mixin Artboard<T> implements StatefulWidget {
  Future<T> get popped => _popCompleter.future;
  final Completer<T> _popCompleter = Completer<T>();

  void didComplete([T result]) => _popCompleter.complete(result);
}

mixin ArtboardState<T extends Artboard> implements State<T> {
  static final smallScreenMaxWidth = 500;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > smallScreenMaxWidth) return buildMedium(context);
    return buildSmall(context);
  }

  Widget buildSmall(BuildContext context);
  Widget buildMedium(BuildContext context) {
    return buildSmall(context);
  }
}
