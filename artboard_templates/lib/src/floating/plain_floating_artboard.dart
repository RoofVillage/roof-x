import 'package:flutter/material.dart';

import 'floating_artboard.dart';

abstract class PlainFloatingArtboard extends FloatingArtboard {
  WidgetBuilder get buildBody;

  @override
  List<Widget> buildChildren(BuildContext context) {
    return <Widget>[
      buildBody(context),
    ];
  }
}
