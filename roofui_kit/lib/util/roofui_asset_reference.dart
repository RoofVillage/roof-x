import './roofui_icon_height.dart';

class RoofUIAssetReference {
  final String path;
  final double height;
  final double width;

  RoofUIAssetReference({this.path, this.height, this.width});
}

class RoofUISmallAssetReference extends RoofUIAssetReference {
  static const _size = RoofUIIconHeight.small;
  RoofUISmallAssetReference({String path})
      : super(path: path, height: _size, width: _size);
}

class RoofUINavigationAssetReference extends RoofUIAssetReference {
  static const _size = RoofUIIconHeight.medium;
  RoofUINavigationAssetReference({String path, double customWidth = _size})
      : super(path: path, height: _size, width: customWidth);
}
