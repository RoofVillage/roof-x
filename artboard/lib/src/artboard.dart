import 'dart:async';

import 'package:flutter/material.dart';

abstract class Artboard<T> extends StatefulWidget {
  T get result => null;

  Future<T> get popped => _popCompleter.future;
  final Completer<T> _popCompleter = Completer<T>();

  void didComplete() => _popCompleter.complete(result);
}
