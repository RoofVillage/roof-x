import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import '../auxiliary_widget.dart';
import '../../input_dock.dart';

class AddFileAuxiliaryWidget extends AuxiliaryWidget {
  static final _iconReference = IconReference.addImage;

  static void _action(BuildContext context) {
    final dock = RoofInputDock.of(context);

    // Open image picker and return selection
    final file = DateTime.now().millisecond.toString();

    print("add file: $file");

    dock.addFile(file);
  }

  AddFileAuxiliaryWidget({Key key})
      : super(
          iconReference: _iconReference,
          action: _action,
        );
}
