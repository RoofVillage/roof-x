import 'package:flutter/material.dart';
import 'package:haptics/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:tappable/index.dart';

class GhostCell extends StatefulWidget {
  final Widget child;
  final void Function() onTap;
  final Color borderColor;

  GhostCell({
    @required this.child,
    this.onTap,
    this.borderColor,
  });

  @override
  _GhostCellState createState() => _GhostCellState();
}

class _GhostCellState extends State<GhostCell> with Tappable {
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
            color: Colors.transparent,
            borderRadius: BorderRadius.all(theme.radius.medium),
            border: widget.borderColor != null
                ? Border.all(color: widget.borderColor)
                : null,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
