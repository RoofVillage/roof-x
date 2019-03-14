import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import '../auxiliary_widget.dart';
import '../../input_dock.dart';

class AddImageAuxiliaryWidget extends AuxiliaryWidget {
  static final _iconReference = IconReference.addImage;

  static void _action(BuildContext context) {
    final dock = RoofInputDock.of(context);

    // Open image picker and return selection
    final image = "file9000";

    print("add image");

    dock.addFile(image);
  }

  AddImageAuxiliaryWidget({Key key})
      : super(
          iconReference: _iconReference,
          action: _action,
        );
}
