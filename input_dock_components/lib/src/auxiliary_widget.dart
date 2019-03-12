import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:icon_library/index.dart';
import 'package:spec/index.dart';

class AuxiliaryWidget {
  final StandardIconReference iconReference;
  final VoidCallback action;

  AuxiliaryWidget({this.iconReference, this.action});

  buildWithSize(double baseHeight) {
    return _AuxiliaryWidget(
      iconReference: iconReference,
      action: action,
      baseHeight: baseHeight,
    );
  }
}

class _AuxiliaryWidget extends StatelessWidget {
  final StandardIconReference iconReference;
  final VoidCallback action;
  final double baseHeight;

  _AuxiliaryWidget({this.iconReference, this.action, this.baseHeight});

  @override
  Widget build(BuildContext context) {
    final iconColor = RoofTheme.of(context).color.icon.general;

    final icon = iconReference.buildSvg(color: iconColor);

    return GestureDetector(
      onTap: action,
      child: Container(
        height: baseHeight,
        margin: EdgeInsets.only(right: RoofDistance.c),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
