import 'package:flutter/material.dart';
import 'interfaces/auth/index.dart';

class Routes {
  Routes() {
    final _routes = <String, WidgetBuilder>{
      _routePath(_Route.auth): (BuildContext context) => Auth()
    };
    runApp(new MaterialApp(
      title: 'Roof',
      routes: _routes,
      initialRoute: _routePath(_Route.auth),
      theme: ThemeData(fontFamily: 'Azo'),
      home: Auth(),
    ));
  }

  _routePath(_Route route) {
    switch (route) {
      case _Route.auth:
        return '/Auth';
    }
  }
}

enum _Route { auth }
