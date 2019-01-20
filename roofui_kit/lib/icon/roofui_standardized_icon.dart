import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:roofui_kit/util/roofui_color.dart';
import 'package:roofui_kit/util/roofui_asset_reference.dart';

class RoofUIStandardizedIcon extends StatelessWidget {
  final RoofUIAssetReference assetReference;
  final Color color;

  RoofUIStandardizedIcon(
      {Key key, this.assetReference, this.color = RoofUIColor.neutralColorG})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(assetReference.path,
        height: assetReference.height,
        width: assetReference.width,
        color: color,
        fit: BoxFit.none);
  }
}
