import 'package:flutter/material.dart';
import 'package:haptics/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:tappable/index.dart';

class CardCell extends StatefulWidget {
  final Widget child;
  final void Function() onTap;
  final Color backgroundColor;
  final Color borderColor;

  CardCell({
    @required this.child,
    this.onTap,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  _CardCellState createState() => _CardCellState();
}

class _CardCellState extends State<CardCell> with Tappable {
  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    return buildTappedAwareGestureDetector(
      onTap: () => hapticAction(
        HapticOption.light,
        action: widget.onTap,
      ),
      child: Opacity(
        opacity: tapped ? .7 : 1,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: theme.distance.padding.horizontal.medium,
            vertical: theme.distance.padding.vertical.medium,
          ),
          decoration: BoxDecoration(
            color:
                widget.backgroundColor ?? theme.color.background.raised,
            borderRadius: BorderRadius.all(theme.radius.medium),
            border: widget.borderColor != null
                ? Border.all(color: widget.borderColor)
                : null,
            boxShadow: [theme.shadow.card],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
