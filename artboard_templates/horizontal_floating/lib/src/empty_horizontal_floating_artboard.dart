import 'package:flutter/material.dart';
import 'package:artboard/index.dart';

import 'utils/horizontal_floating_artboard.dart';

abstract class EmptyHorizontalFloatingArtboard<T> extends StatefulWidget
    with HorizontalFloatingArtboard<T>, Artboard<T> {}
