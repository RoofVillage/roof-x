import 'package:flutter/material.dart';
import 'package:haptics/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:tappable/index.dart';

class StandardCell extends StatefulWidget {
  final Widget child;
  final void Function() onTap;

  StandardCell({
    @required this.child,
    this.onTap,
  });

  @override
  _StandardCellState createState() => _StandardCellState();
}

class _StandardCellState extends State<StandardCell> with Tappable {
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
            horizontal: theme.distance.gutter.horizontal.medium,
            vertical: theme.distance.gutter.vertical.medium,
          ),
          child: widget.child,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: theme.color.stroke.medium),
            ),
          ),
        ),
      ),
    );
  }
}
