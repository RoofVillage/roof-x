import 'package:flutter/material.dart';
import 'package:roof/util/decorated_text.dart';

class PublicActivityData {
  final WeightDecoratedText title;
  final String description;
  final String iconPath;

  PublicActivityData(
      {@required this.title,
      @required this.description,
      @required this.iconPath});
}
