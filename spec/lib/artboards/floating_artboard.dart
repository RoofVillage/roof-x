// import 'package:flutter/material.dart';

// import 'package:spec/nav_bars/index.dart';
// import 'package:spec/nav_buttons/index.dart';
// import 'package:spec/theme/index.dart';

// abstract class FloatingArtboard extends StatelessWidget {
//   Widget get body;

//   @override
//   Widget build(BuildContext context) {
//     final theme = RoofTheme.of(context);
//     return Scaffold(
//         backgroundColor: theme.color.background.general,
//         body: Center(
//             child: Column(
//           // Stretch the cards in horizontal axis
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             navBar,
//             Expanded(
//                 /*
//               Wrap in MediaQuery to remove the top padding that the Scaffold will assume is necessary.
//               See https://github.com/flutter/flutter/issues/14842
//             */
//                 child: MediaQuery.removePadding(
//                     context: context, removeTop: true, child: body))
//           ],
//         )));
//   }
// }
