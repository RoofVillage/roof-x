import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:image_picker_component/index.dart';

import '../auxiliary_widget.dart';
import '../../input_dock.dart';

class AddFileAuxiliaryWidget extends AuxiliaryWidget {
  static final _iconReference = IconReference.addImage;

  static void _action(BuildContext context) async {
    final dock = RoofInputDock.of(context);

    final files = await RoofImagePicker.pickImages(
      context: context,
      thumbnailWidth: dock.previewWidth.toInt(),
      thumbnailHeight: dock.previewHeight.toInt(),
    );

    if (files == null) return;

    dock.addFiles(files);
  }

  AddFileAuxiliaryWidget({Key key})
      : super(
          iconReference: _iconReference,
          action: _action,
        );
}
