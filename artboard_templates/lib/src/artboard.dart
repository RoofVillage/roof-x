import 'package:flutter/material.dart';
import 'package:navigation_components/index.dart';
import 'package:theme/index.dart';

abstract class RoofArtboard extends StatelessWidget {
  Widget get body;
  List<RoofNavButton> get actionButtons;
  RoofNavButton get navButton => null;
  String get title => null;

  RoofNavBar get navBar {
    if (navButton != null) {
      return RoofTitleNavBar(
          actionButtons: actionButtons, title: title, navButton: navButton);
    } else if (title != null) {
      return RoofLogoNavBar(actionButtons: actionButtons, title: title);
    } else {
      return RoofFullLogoNavBar(actionButtons: actionButtons);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    return Scaffold(
        backgroundColor: theme.color.background.general,
        body: Center(
            child: Column(
          // Stretch the cards in horizontal axis
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            navBar,
            Expanded(
                /*
              Wrap in MediaQuery to remove the top padding that the Scaffold will assume is necessary.
              See https://github.com/flutter/flutter/issues/14842
            */
                child: MediaQuery.removePadding(
                    context: context, removeTop: true, child: body))
          ],
        )));
  }

  // @override
  // present(BuildContext context) {
  // final current = RoofTheme.of(context).current;
  // final routeBuilder = PageRouteBuilder(
  //     opaque: true,
  //     transitionDuration: RoofDuration.short,
  //     pageBuilder: (BuildContext context, _, __) {
  //       return RoofTheme(RoofThemeOption.dark, child: this);
  //     },
  //     transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
  //       return SlideTransition(
  //         position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
  //             .animate(animation),
  //         child: child,
  //       );
  //     });

  //   Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => RoofTheme(RoofThemeOption.dark, child: this)));
  // }
}
