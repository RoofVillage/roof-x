import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:artboard/index.dart';

mixin FullScreenArtboard implements Artboard {
  Widget buildBody(BuildContext context);

  @override
  State<StatefulWidget> createState() => _FullScreenScreenArtboardState();
}

mixin FullScreenArtboardState<T extends FullScreenArtboard>
    implements State<T> {
  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final scaffold = Scaffold(
        backgroundColor: theme.color.background.general,
        body: widget.buildBody(context));

    return RoofTheme(theme.current, child: scaffold);
  }
}

class _FullScreenScreenArtboardState extends State<FullScreenArtboard>
    with FullScreenArtboardState {}
