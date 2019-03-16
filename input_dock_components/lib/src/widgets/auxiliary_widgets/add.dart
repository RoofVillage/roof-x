import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';

import '../auxiliary_widget.dart';

class AddFileAuxiliaryWidget extends AuxiliaryWidget {
  static final _iconReference = IconReference.add;

  static void _action(BuildContext context) async {
    // open button sheet to 
  }

  AddFileAuxiliaryWidget({Key key})
      : super(
          iconReference: _iconReference,
          action: _action,
        );
}
