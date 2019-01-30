import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:button_components/index.dart';

import 'widgets/index.dart';

abstract class FormFloatingArtboard extends StatelessWidget {
  WidgetBuilder get buildBody;
  String get title;
  String get subtitle;
  RoofSubmitButton button;
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
          button: button,
        )),
        backgroundColor: Colors.transparent);

    return RoofTheme(theme.current, child: scaffold);
  }
}

class _FormFloatingArtboardPage extends StatelessWidget {
  final body;
  final title;
  final subtitle;
  final button;

  ///Draw them!

  _FormFloatingArtboardPage(
      {this.body, this.title, this.subtitle, this.button});

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    return ConstrainedFloatingArtboardPage(
        color: theme.color.background.brandSecondary,
        shadow: theme.shadow,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(title),
              Text(subtitle),
              body,
              Container(height: 20),
              button
            ],
          ),
        ));
  }
}
