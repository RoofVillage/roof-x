import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:artboard/index.dart';
import 'package:file_upload_artboards/index.dart';

import '../auxiliary_widget.dart';
import "../../input_dock.dart";

class AddAuxiliaryWidget extends AuxiliaryWidget {
  static final _iconReference = IconReference.add;

  static void _action(BuildContext context) async {
    // open button sheet to
    final file = await ArtboardNavigator.of(context)
        .goTo(FileUploadArtboard(), context: context);
    if (file == null) return;

    RoofInputDock.of(context).addFiles([file]);
  }

  AddAuxiliaryWidget()
      : super(
          iconReference: _iconReference,
          action: _action,
        );
}
