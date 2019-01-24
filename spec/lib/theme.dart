// import 'package:flutter/material.dart';

// import 'package:spec/color.dart';

// enum RoofThemeOption { light, dark }

// class RoofTheme extends StatefulWidget {
//   final Widget child;

//   RoofTheme({this.child});

//   static RoofThemeState of(BuildContext context) {
//     return (context.inheritFromWidgetOfExactType(_RoofInheritedStateContainer)
//             as _RoofInheritedStateContainer)
//         .data;
//   }

//   @override
//   State<StatefulWidget> createState() => RoofThemeState();
// }

// class RoofThemeState extends State<RoofTheme> {
//   Color get navBarBackgroundColor {
//     switch (theme) {
//       case RoofThemeOption.light:
//         return RoofColor.neutralColorA;
//       case RoofThemeOption.dark:
//         return RoofColor.neutralColorG;
//     }
//     return null;
//   }

//   Color get navBarButtonIconColor {
//     switch (theme) {
//       case RoofThemeOption.light:
//         return RoofColor.neutralColorF;
//       case RoofThemeOption.dark:
//         return RoofColor.neutralColorA;
//     }
//     return null;
//   }

//   RoofThemeOption theme;

//   void use(RoofThemeOption theme) {
//     if (this.theme == theme) return;
//     setState(() {
//       this.theme = theme;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _RoofInheritedStateContainer(data: this, child: widget.child);
//   }
// }

// class _RoofInheritedStateContainer extends InheritedWidget {
//   final RoofThemeState data;

//   _RoofInheritedStateContainer(
//       {Key key, @required this.data, @required Widget child})
//       : super(key: key, child: child);

//   @override
//   bool updateShouldNotify(_RoofInheritedStateContainer oldWidget) =>
//       data.theme != oldWidget.data.theme;
// }
