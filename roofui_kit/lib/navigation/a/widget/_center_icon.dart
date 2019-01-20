import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:roofui_kit/util/roofui_color.dart';
import 'package:roofui_kit/util/roofui_asset_reference.dart';

class NavCenterIcon extends StatelessWidget {
  final RoofUIAssetReference assetReference;

  NavCenterIcon({Key key, this.assetReference}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetReference.path,
      height: assetReference.height,
      width: assetReference.width,
      color: RoofUIColor.neutralColorG,
      fit: BoxFit.none,
    );
  }
}
