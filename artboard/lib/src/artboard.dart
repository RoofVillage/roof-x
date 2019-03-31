import 'dart:async';

import 'package:flutter/material.dart';

abstract class Artboard<T> extends StatefulWidget {
  Future<T> get popped => _popCompleter.future;
  final Completer<T> _popCompleter = Completer<T>();

  void didComplete([T result]) => _popCompleter.complete(result);
}
