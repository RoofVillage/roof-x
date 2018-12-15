import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roofui_kit/util/roofui_color.dart';
import 'package:roofui_kit/util/roofui_icon_reference.dart';

class RoofUIStandardizedIcon extends StatelessWidget {
  final StandardizedIconReference iconReference;
  final Color color;

  RoofUIStandardizedIcon(
      {this.iconReference, this.color = RoofUIColor.neutralColorG});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(iconReference.path,
        height: iconReference.height,
        width: iconReference.width,
        color: color,
        fit: BoxFit.none);
  }
}
