import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:theme/index.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import '../auxiliary_widget.dart';
import '../../input_dock.dart';

class AddFileAuxiliaryWidget extends AuxiliaryWidget {
  static final _iconReference = IconReference.addImage;

  static String _convertToHex(Color color) {
    final stringWithAlpha = color.value.toRadixString(16);
    final stringWithoutAlpha =
        stringWithAlpha.substring(2, stringWithAlpha.length);
    final formattedString = "#$stringWithoutAlpha";
    return formattedString;
  }

  static void _action(BuildContext context) async {
    final theme = RoofTheme.of(context);
    final dock = RoofInputDock.of(context);

    final files = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        options: CupertinoOptions(
          selectionFillColor: _convertToHex(Colors.white),
          selectionStrokeColor: _convertToHex(Colors.white),
          selectionShadowColor: _convertToHex(theme.shadow.color),
          selectionTextColor: _convertToHex(Colors.black45),
        ));

    if (files == null) return;

    final int screenResMultipler = 3;
    final int previewWidth = dock.previewWidth.toInt() * screenResMultipler;
    final int previewHeight = dock.previewHeight.toInt() * screenResMultipler;

    for (var file in files) {
      await file.requestThumbnail(previewWidth, previewHeight);
    }

    dock.addFiles(files);
  }

  AddFileAuxiliaryWidget({Key key})
      : super(
          iconReference: _iconReference,
          action: _action,
        );
}
