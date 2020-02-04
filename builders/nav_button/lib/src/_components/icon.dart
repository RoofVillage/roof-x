import 'package:flutter/material.dart';
import 'package:navigation_icon_library/index.dart';
import 'package:typedefs/index.dart';
import 'package:semantic_theme/index.dart';

import 'nav_button.dart';

class IconNavButton extends StatelessWidget with NavButton {
  final ContextPasser onTap;

  final NavigationIcon iconReference;

  @override
  Widget buildIcon(BuildContext context) {
    final theme = SemanticTheme.of(context);
    
    final _blank = NavigationIcon(null);

    return (iconReference ?? _blank).buildWidget(
      color: theme.color.icon.nav,
    );
  }

  IconNavButton({
    @required this.iconReference,
    @required this.onTap,
  });
}
