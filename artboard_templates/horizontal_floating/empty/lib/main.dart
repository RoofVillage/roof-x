// import 'package:flutter/material.dart';
// import 'package:artboard/index.dart';

// import 'src/utils/navigator.dart';
// import 'src/empty_horizontal_floating_artboard.dart';
// import 'src/utils/horizontal_floating_artboard.dart';

// void main() {
//   runApp(_Roof());
// }

// class _Roof extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Artboard startingArtboard = _DemoArtboard();

//     return HorizontalFloatingArtboardNavigator(artboard: startingArtboard);
//   }
// }

// class _DemoArtboard extends EmptyHorizontalFloatingArtboard {
//   @override
//   State<StatefulWidget> createState() => _DemoArtboardState();
// }

// class _DemoArtboardState extends State<_DemoArtboard>
//     with
//         HorizontalFloatingArtboardState<_DemoArtboard>,
//         ArtboardState<_DemoArtboard> {
//   @override
//   Widget buildBody(BuildContext context) {
//     return Container(color: Colors.blue, width: 400);
//   }
// }
