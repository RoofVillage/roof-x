import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:spec/color.dart';
// import 'package:spec/theme.dart';

class RoofNavButton extends StatelessWidget {
  final NavigationIconReference iconReference;
  final Function onTap;

  final _blank = NavigationIconReference();

  RoofNavButton({@required this.iconReference, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    // final color = RoofTheme.of(context).navBarButtonIconColor;
    return GestureDetector(
        onTap: onTap,
        child: (iconReference ?? _blank)
            .buildSvg(color: RoofColor.neutralColorG) //color),
        );
  }
}
