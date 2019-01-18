import './roofui_icon_height.dart';

class RoofUIIconReference {
  final String path;
  final double height;
  final double width;

  RoofUIIconReference({this.path, this.height, this.width});
}

class RoofUISmallIconReference extends RoofUIIconReference {
  static const _size = RoofUIIconHeight.small;
  RoofUISmallIconReference({String path})
      : super(path: path, height: _size, width: _size);
}

class RoofUINavigationIconReference extends RoofUIIconReference {
  static const _size = RoofUIIconHeight.medium;
  RoofUINavigationIconReference({String path, double customWidth = _size})
      : super(path: path, height: _size, width: customWidth);
}
