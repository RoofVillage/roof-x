import 'dart:async';
import 'package:flutter/material.dart';

mixin Artboard<T> implements StatefulWidget {
  Future<T> get popped => _popCompleter.future;
  final Completer<T> _popCompleter = Completer<T>();

  void didComplete([T result]) => _popCompleter.complete(result);
}

mixin ArtboardState<T extends Artboard> implements State<T> {}
