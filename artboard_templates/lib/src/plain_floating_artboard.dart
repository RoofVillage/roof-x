import 'package:flutter/material.dart';
import 'package:theme/index.dart';

import 'widgets/index.dart';

abstract class PlainFloatingArtboard extends StatelessWidget {
  WidgetBuilder get buildBody;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final scaffold = Scaffold(
        body: FloatingArtboard(
            page: _PlainFloatingArtboardPage(body: buildBody(context))),
        backgroundColor: Colors.transparent);

    return RoofTheme(theme.current, child: scaffold);
  }
}

class _PlainFloatingArtboardPage extends StatelessWidget {
  final body;

  _PlainFloatingArtboardPage({this.body});

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    return ConstrainedFloatingArtboardPage(
      color: theme.color.background.brandSecondary,
      shadow: theme.shadow,
      child: Container(child: body),
    );
  }
}
