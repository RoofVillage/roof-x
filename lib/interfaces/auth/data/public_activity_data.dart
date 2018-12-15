import 'package:flutter/material.dart';
import 'package:roofui_kit/util/roofui_decorated_text.dart';
import 'package:roofui_kit/util/roofui_icon_reference.dart';

class PublicActivityData {
  final WeightDecoratedText title;
  final String description;
  final StandardizedIconReference iconReference;

  PublicActivityData(
      {@required this.title,
      @required this.description,
      @required this.iconReference});
}
