import 'package:flutter/material.dart';
import 'package:artboard/index.dart';
import 'package:horizontal_floating_artboard_scaffold/index.dart';

abstract class EmptyHorizontalFloatingArtboard<T> extends StatefulWidget
    with HorizontalFloatingArtboard<T>, Artboard<T> {}
