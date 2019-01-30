import 'package:flutter/material.dart';
import 'package:theme/index.dart';

import 'widgets/index.dart';

abstract class FormFloatingArtboard extends StatelessWidget {
  WidgetBuilder get buildBody;
  String get title;
  String get subtitle;
  // ...etc

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final scaffold = Scaffold(
        body: FloatingArtboard(
            page: _FormFloatingArtboardPage(
          body: buildBody(context),
          title: title,
          subtitle: subtitle,
        )),
        backgroundColor: Colors.transparent);

    return RoofTheme(theme.current, child: scaffold);
  }
}

class _FormFloatingArtboardPage extends StatelessWidget {
  final body;
  final title;
  final subtitle;

  ///Draw them!

  _FormFloatingArtboardPage({this.body, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    return ConstrainedFloatingArtboardPage(
        color: theme.color.background.brandSecondary,
        shadow: theme.shadow,
        child: Container(
          color: Colors.teal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[Text(title), Text(subtitle), body],
          ),
        ));
  }
}
