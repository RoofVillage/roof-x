import 'package:flutter/material.dart';
import 'package:button_builder/src/types/index.dart';
import 'package:theme/index.dart';
import 'package:standard_icon_library/index.dart';

import '_mixins/icon_button.dart';
export '_mixins/icon_button.dart';

class RoofPrimaryIconButton extends StatelessWidget with RoofIconButton {
  final OnTap onTap;
  final StandardIcon iconReference;

  get context => (context);
  get iconColor => (context) {
        final theme = RoofTheme.of(context);
        return theme.color.text.primaryAction;
      };

  RoofPrimaryIconButton({
    @required this.onTap,
    @required this.iconReference,
  });

  @override
  Widget build(BuildContext context) => buildButton(context);
}
