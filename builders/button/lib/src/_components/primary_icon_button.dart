import 'package:flutter/material.dart';
import 'package:button_builder/src/types/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:standard_icon_library/index.dart';

import '_mixins/icon_button.dart';

class PrimaryIconButton extends StatelessWidget with IconStyleButton {
  final OnTap onTap;
  final StandardIcon iconReference;

  get context => (context);
  get iconColor => (context) {
        return SemanticTheme.of(context).color.icon.action;
      };

  PrimaryIconButton({
    @required this.onTap,
    @required this.iconReference,
  });

  @override
  Widget build(BuildContext context) => buildButton(context);
}
