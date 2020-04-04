import 'package:flutter/material.dart';
import 'package:form_body_builder/src/_components/field_container.dart';
import 'package:form_body_builder/src/_components/utils/min_field_height.dart';
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

    final _removeButtonWidth = minFieldHeight;

    final removeButton = GestureDetector(
      onTap: () => hapticAction(
        HapticOption.light,
        action: onRemove,
      ),
      child: Container(
        width: _removeButtonWidth,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: theme.distance.padding.vertical.small,
            ),
            child: SmallIcon.x.buildWidget(
              color: theme.color.icon.generalSecondary,
            ),
          ),
        ),
      ),
    );

    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        FieldContainer(
          child: Padding(
            padding: EdgeInsets.only(
              left:
                  _removeButtonWidth - theme.distance.padding.horizontal.medium,
            ),
            child: child,
          ),
        ),
        removeButton,
      ],
    );
  }
}
