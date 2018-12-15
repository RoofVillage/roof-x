import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roofui_kit/util/roofui_color.dart';
import 'package:roofui_kit/util/roofui_icon_reference.dart';

class NavCenterIcon extends StatelessWidget {
  final IconReference iconReference;

  NavCenterIcon({Key key, this.iconReference}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconReference.path,
      height: iconReference.height,
      width: iconReference.width,
      color: RoofUIColor.neutralColorG,
      fit: BoxFit.none,
    );
  }
}
