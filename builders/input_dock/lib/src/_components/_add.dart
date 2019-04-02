import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';

import '_mixins/auxiliary_widget.dart';

class AddAuxiliaryWidget extends StatelessWidget with AuxiliaryWidget {
  @override
  get iconReference => IconReference.add;

  void action(BuildContext context) async {
    // open button sheet to
    // final file = await ArtboardNavigator.of(context).goTo(FileUploadArtboard());
    // if (file == null) return;

    // RoofInputDock.of(context).addFiles([file]);
  }
}
