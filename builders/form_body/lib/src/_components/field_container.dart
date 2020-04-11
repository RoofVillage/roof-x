import 'package:flutter/material.dart';
import 'package:form_body_builder/src/_components/utils/min_field_height.dart';
import 'package:semantic_theme/index.dart';

class FieldContainer extends StatelessWidget {
  final Widget child;

  FieldContainer({this.child});

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: theme.distance.padding.vertical.min,
        horizontal: theme.distance.padding.horizontal.medium,
      ),
      constraints: BoxConstraints(
        minHeight: minFieldHeight,
      ),
      decoration: BoxDecoration(
        color: theme.color.background.raised,
        borderRadius: BorderRadius.all(theme.radius.small),
      ),
      child: Center(child: child),  
    );
  }
}
