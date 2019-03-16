import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:image_picker/image_picker.dart';

import '../auxiliary_widget.dart';
import '../../input_dock.dart';

class AddFileAuxiliaryWidget extends AuxiliaryWidget {
  static final _iconReference = IconReference.addImage;

  static void _action(BuildContext context) async {
    final dock = RoofInputDock.of(context);

    final file = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (file == null) return;

    dock.addFile(file);
  }

  AddFileAuxiliaryWidget({Key key})
      : super(
          iconReference: _iconReference,
          action: _action,
        );
}
