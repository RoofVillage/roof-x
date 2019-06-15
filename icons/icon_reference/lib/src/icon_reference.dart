import 'package:flutter/material.dart';

class IconReference {
  final IconData iconData;
  final double size;

  IconReference({
    @required this.iconData,
    this.size,
  });

  Icon buildWidget({Color color}) {
    return Icon(
      iconData,
      size: size,
      color: color,
    );
  }
}
