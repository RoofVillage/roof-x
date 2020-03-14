import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:standard_icon_library/index.dart';
import 'package:tappable/index.dart';
import 'package:typedefs/index.dart';

import '_mixins/list_button.dart';

class PrimaryListButton extends StatefulWidget with ListStyleButton {
  final ContextPasser onTap;
  final String text;
  final String badgeText;
  final StandardIcon iconReference;

  @override
  get textColor =>
      (context) => SemanticTheme.of(context).color.text.generalPrimary;

  @override
  get badgeTextColor =>
      (context) => SemanticTheme.of(context).color.text.action;

  @override
  get iconColor =>
      (context) => SemanticTheme.of(context).color.icon.generalPrimary;

  PrimaryListButton({
    @required this.onTap,
    @required this.text,
    this.iconReference,
    this.badgeText,
  });

  @override
  State<StatefulWidget> createState() => _PrimaryListButtonState();
}

class _PrimaryListButtonState extends State<PrimaryListButton>
    with Tappable, ListButtonState {
  @override
  Widget build(BuildContext context) => buildButton(context);

  @override
  ListStyleButton get button => widget;
}
