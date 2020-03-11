import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:semantic_theme/index.dart';
import 'package:artboard/index.dart';

mixin VerticalFullScreenArtboard implements StatefulWidget, Artboard {
  Widget buildBody(BuildContext context);
  // TODO make buildNavBar and buildDock not resolve to null
  Widget buildNavBar(BuildContext context) => null;
  Widget buildDock(BuildContext context) => null;

  @override
  State<StatefulWidget> createState() => _VerticalFullScreenArtboardState();
}

mixin VerticalFullScreenArtboardState<T extends VerticalFullScreenArtboard>
    implements State<T> {
  double _navBarHeight;
  double _dockHeight;
  final _navBarContainerKey = GlobalKey();
  final _dockContainerKey = GlobalKey();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => _readWidgetHeights(),
    );
  }

  void _readWidgetHeights() {
    final navBarContext = _navBarContainerKey.currentContext;
    final dockContext = _dockContainerKey.currentContext;

    if (navBarContext == null && dockContext == null) return;

    setState(() {
      if (navBarContext != null) {
        _navBarHeight = navBarContext.size.height ?? 0;
      }
      if (dockContext != null) {
        _dockHeight = dockContext.size.height ?? 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final body = widget.buildBody(context);
    final navBar = widget.buildNavBar(context);
    final dock = widget.buildDock(context);

    final stackChildren = <Widget>[];

    final positionedBody = Positioned(
      top: _navBarHeight ?? 0,
      bottom: _dockHeight ?? 0,
      left: 0,
      right: 0,
      child: Container(
        child: body,
      ),
    );

    stackChildren.add(positionedBody);

    if (navBar != null) {
      stackChildren.add(
        Positioned(
          key: _navBarContainerKey,
          top: 0,
          left: 0,
          right: 0,
          child: navBar,
        ),
      );
    }

    if (dock != null) {
      stackChildren.add(
        Positioned(
          key: _dockContainerKey,
          bottom: 0,
          left: 0,
          right: 0,
          child: dock,
        ),
      );
    }

    final stack = Stack(
      children: stackChildren,
      alignment: AlignmentDirectional.bottomCenter,
    );

    final scaffold = Scaffold(
      backgroundColor: theme.color.background.generalSecondary,
      body: SafeArea(
        top: false,
        child: stack,
      ),
    );

    return scaffold;
  }
}

class _VerticalFullScreenArtboardState<T extends VerticalFullScreenArtboard>
    extends State<T> with VerticalFullScreenArtboardState<T> {}
