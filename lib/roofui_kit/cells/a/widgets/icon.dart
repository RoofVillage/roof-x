import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roof/roofui_kit/roofui_color.dart';

class CellIcon extends StatelessWidget {
  final String path;

  CellIcon({this.path});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      color: RoofUIColor.neutralColorGradientG,
      fit: BoxFit.none,
    );
  }
}
