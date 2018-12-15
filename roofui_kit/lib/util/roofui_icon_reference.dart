import './roofui_icon_height.dart';

class IconReference {
  final String path;
  final double height;
  final double width;

  IconReference({this.path, this.height, this.width});
}

class StandardizedIconReference extends IconReference {
  static const _size = RoofUIIconHeight.small;
  StandardizedIconReference({String path})
      : super(path: path, height: _size, width: _size);
}
