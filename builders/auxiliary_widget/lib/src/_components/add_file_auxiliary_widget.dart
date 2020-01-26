import 'package:flutter/material.dart';
import 'package:standard_icon_library/index.dart';
import 'package:image_picker_builder/index.dart';
import 'package:button_builder/index.dart';
import 'package:input_dock_builder/index.dart';

import '_auxiliary_widget.dart';

class AddFileAuxiliaryWidget extends StatelessWidget
    with ImagePickerBuilder, PrimaryIconButtonBuilder {
  void action(BuildContext context) async {
    final dock = InputDock.of(context);

    final files = await pickImages(
      context: context,
      thumbnailWidth: dock.previewWidth.toInt(),
      thumbnailHeight: dock.previewHeight.toInt(),
    );

    if (files == null) return;

    dock.addFiles(files);
  }

  @override
  Widget build(BuildContext context) {
    final iconReference = StandardIcon.addImage;

    final iconButton = buildPrimaryIconButton(
      context,
      onTap: action,
      iconReference: iconReference,
    );

    return AuxiliaryWidget(
      child: iconButton,
    );
  }
}
