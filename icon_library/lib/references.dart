import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SmallIconReference extends _IconReference {
  static const double _size = 28;

  SmallIconReference({String path = ""})
      : super(path: "basic/$path", height: _size, width: _size);
}

class NavigationIconReference extends _IconReference {
  static const double _size = 32;

  NavigationIconReference({String path = "", double customWidth = _size})
      : super(path: "navigation/$path", height: _size, width: customWidth);
}

class EmptyIconReference extends _IconReference {
  static const double _size = 32;

  EmptyIconReference({String path, double customWidth = _size})
      : super(path: "navigation/$path", height: _size, width: customWidth);
}

class AnimatedIconReference extends StatelessWidget {
  final Widget icon1;
  final Widget icon2;
  final bool showIcon1;

  AnimatedIconReference({this.icon1, this.icon2, this.showIcon1});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: icon1,
        secondChild: icon2,
        duration: Duration(milliseconds: 120),
        crossFadeState:
            showIcon1 ? CrossFadeState.showFirst : CrossFadeState.showSecond);
  }
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