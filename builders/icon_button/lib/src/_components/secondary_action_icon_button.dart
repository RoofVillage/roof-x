import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:x_small_icon_library/index.dart';

import 'standard_icon_button.dart';

class SecondaryActionIconButton extends StatelessWidget with StandardIconButton {
  final void Function() onTap;
  final XSmallIcon iconReference;

  @override
  Widget buildIcon(BuildContext context) {
    final _blank = XSmallIcon(null);

    return (iconReference ?? _blank).buildWidget(
      color: SemanticTheme.of(context).color.icon.generalSecondary,
    );
  }

  SecondaryActionIconButton({
    @required this.iconReference,
    @required this.onTap,
  });
}
