import 'package:flutter/material.dart';
import 'package:artboard/index.dart';
import 'package:vertical_floating_artboard_button_option/index.dart';

import 'utils/vertical_floating_artboard.dart';

abstract class EmptyVerticalFloatingArtboard<T> extends StatefulWidget
    with VerticalFloatingArtboard<T>, Artboard<T> {
  VerticalFloatingArtboardButtonOption get navButtonOption => null;
}
