import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _localPath = "lib/src/";

class SmallIconReference extends _IconReference {
  static const double _size = 24;

  SmallIconReference({String path = ""})
      : super(path: _localPath + "small/$path", height: _size, width: _size);
}

class StandardIconReference extends _IconReference {
  static const double _size = 28;

  StandardIconReference({String path = ""})
      : super(path: _localPath + "standard/$path", height: _size, width: _size);
}

class NavigationIconReference extends _IconReference {
  static const double _size = 32;

  NavigationIconReference({String path = "", double customWidth = _size})
      : super(
            path: _localPath + "navigation/$path",
            height: _size,
            width: customWidth);
}

class _IconReference {
  final String path;
  final double height;
  final double width;

  _IconReference({this.path, this.height, this.width});

  Widget buildSvg({Color color}) {
    if (path != null && path.endsWith(".svg")) {
      return SvgPicture.asset(path,
          package: "icon_library", height: height, width: width, color: color);
    } else {
      return Container(width: width, height: height);
    }
  }
}
