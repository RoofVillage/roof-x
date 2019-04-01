import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:image_picker_builder/index.dart';

import 'mixins/auxiliary_widget.dart';
import 'input_dock.dart';

class AddFileAuxiliaryWidget extends StatelessWidget
    with AuxiliaryWidget, ImagePickerBuilder {
  @override
  get iconReference => IconReference.addImage;

  @override
  void action(BuildContext context) async {
    final dock = RoofInputDock.of(context);

    final files = await pickImages(
      context: context,
      thumbnailWidth: dock.previewWidth.toInt(),
      thumbnailHeight: dock.previewHeight.toInt(),
    );

    if (files == null) return;

    dock.addFiles(files);
  }
}
