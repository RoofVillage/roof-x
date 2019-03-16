import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:artboard/index.dart';
import 'package:auth_artboards/index.dart';

import '../auxiliary_widget.dart';

class AddAuxiliaryWidget extends AuxiliaryWidget {
  static final _iconReference = IconReference.add;

  static void _action(BuildContext context) async {
    // open button sheet to
    ArtboardNavigator.of(context).goTo(SignUpArtboard(), context: context);
  }

  AddAuxiliaryWidget()
      : super(
          iconReference: _iconReference,
          action: _action,
        );
}
