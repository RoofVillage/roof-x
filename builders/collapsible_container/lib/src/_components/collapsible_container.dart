import 'package:flutter/material.dart';
import 'package:visibility_manager/index.dart';
import 'package:duration/index.dart' as duration;
import 'package:curve/index.dart' as curve;

class CollapsibleContainer extends StatefulWidget {
  final Widget child;

  CollapsibleContainer({@required this.child, Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CollapsibleContainerState();
}

class _CollapsibleContainerState extends State<CollapsibleContainer>
    with SingleTickerProviderStateMixin {
  final _duration = duration.short;
  final _curve = curve.quick;

  @override
  Widget build(BuildContext context) {
    final visibilityManager = InheritedVisibilityManager.of(context);

    final visible = visibilityManager?.visible ?? false;

    return AnimatedSize(
      duration: _duration,
      curve: _curve,
      vsync: this,
      child: Container(
        height: visible ? null : 0,
        child: widget.child,
      ),
    );
  }
}
