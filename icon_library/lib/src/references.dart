import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationIconReference extends _IconReference {
  static const double _size = 32;

  NavigationIconReference(IconData iconData)
      : super(
          iconData: iconData,
          size: _size,
        );
}

class StandardIconReference extends _IconReference {
  static const double _size = 28;

  StandardIconReference(IconData iconData)
      : super(
          iconData: iconData,
          size: _size,
        );
}

class SmallIconReference extends _IconReference {
  static const double _size = 24;

  SmallIconReference(IconData iconData)
      : super(
          iconData: iconData,
          size: _size,
        );
}

class XSmallIconReference extends _IconReference {
  static const double _size = 20;

  XSmallIconReference(IconData iconData)
      : super(
          iconData: iconData,
          size: _size,
        );
}

class SvgReference extends _SvgReference {
  static const _localPath = "lib/src/";

  static const double _size = 32;

  SvgReference({String path = "", double width = _size, double height = _size})
      : super(path: _localPath + "custom/$path", height: height, width: width);
}

class _SvgReference {
  final String path;
  final double height;
  final double width;

  _SvgReference({this.path, this.height, this.width});

  Widget buildSvg({Color color}) {
    if (path != null && path.endsWith(".svg")) {
      return SvgPicture.asset(
        path,
        package: "icon_library",
        height: height,
        width: width,
        color: color,
      );
    } else {
      return Container(
        width: width,
        height: height,
      );
    }
  }
}

class _IconReference {
  final IconData iconData;
  final double size;

  _IconReference({
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
