import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:semantic_theme/index.dart';
import 'package:artboard/index.dart';

mixin VerticalDrawerArtboard<T> implements StatefulWidget, Artboard<T> {
  Widget buildHeader(BuildContext context);
  Widget buildBody(BuildContext context);
  Widget buildDock(BuildContext context);

  @override
  State<StatefulWidget> createState() => _VerticalDrawerArtboardState();
}

mixin VerticalDrawerArtboardState<T extends VerticalDrawerArtboard>
    implements State<T> {
  double _headerHeight;
  double _dockHeight;
  final _headerContainerKey = GlobalKey();
  final _dockContainerKey = GlobalKey();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => _readWidgetHeights(),
    );
  }

  void _readWidgetHeights() {
    final headerContext = _headerContainerKey.currentContext;
    final dockContext = _dockContainerKey.currentContext;

    if (headerContext == null && dockContext == null) return;

    setState(() {
      if (headerContext != null) {
        _headerHeight = headerContext.size.height ?? 0;
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
    final header = widget.buildHeader(context);
    final dock = widget.buildDock(context);

    final stackChildren = <Widget>[];

    final positionedBody = Positioned(
      top: _headerHeight ?? 0,
      bottom: _dockHeight ?? 0,
      left: 0,
      right: 0,
      child: Container(
        child: body,
      ),
    );

    stackChildren.add(positionedBody);

    if (header != null) {
      stackChildren.add(
        Positioned(
          key: _headerContainerKey,
          top: 0,
          left: 0,
          right: 0,
          child: header,
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
      backgroundColor: theme.color.background.raised,
      body: SafeArea(
        top: false,
        child: stack,
      ),
    );

    return scaffold;
  }
}

class _VerticalDrawerArtboardState<T extends VerticalDrawerArtboard>
    extends State<T> with VerticalDrawerArtboardState<T> {}
