import 'package:flutter/material.dart';
import 'package:form_body_builder/src/_components/field_container.dart';
import 'package:semantic_theme/index.dart';
import 'package:haptics/index.dart';
import 'package:small_icon_library/index.dart';

class RemovableFieldContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback onRemove;

  RemovableFieldContainer({this.child, this.onRemove});

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final removeButton = GestureDetector(
      onTap: () => hapticAction(
        HapticOption.light,
        action: onRemove,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: theme.distance.padding.horizontal.medium,
          vertical: theme.distance.padding.vertical.small,
        ),
        child: SmallIcon.x.buildWidget(
          color: theme.color.icon.generalSecondary,
        ),
      ),
    );

    return Container(
      child: Row(
        children: [
          removeButton,
          Expanded(
            child: FieldContainer(
              child: child,
            ),
          )
        ],
      ),
    );
  }
}
