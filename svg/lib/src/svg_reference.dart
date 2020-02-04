import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgReference extends _SvgReference {
  static const _localPath = "lib/src/_assets/";
  static const double _size = 32;

  SvgReference({
    String path = "",
    double width = _size,
    double height = _size,
  }) : super(
          path: _localPath + path,
          height: height,
          width: width,
        );

  static final logoFull = SvgReference(
    path: "logo_full.svg",
    width: 65,
  );
}

class _SvgReference {
  final String path;
  final double height;
  final double width;

  _SvgReference({
    this.path,
    this.height,
    this.width,
  });

  Widget buildSvg({Color color}) {
    if (path != null && path.endsWith(".svg")) {
      return SvgPicture.asset(
        path,
        package: "svg",
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
