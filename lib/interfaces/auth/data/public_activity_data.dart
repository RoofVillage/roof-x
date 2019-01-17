import 'package:flutter/material.dart';
import 'package:roofui_kit/util/roofui_decorated_text.dart';
import 'package:roofui_kit/util/roofui_icon_reference.dart';

abstract class Streamable {
  final String id = "";
}

class PublicActivityData implements Streamable {
  final String id;
  final WeightDecoratedText title;
  final String description;
  final StandardizedIconReference iconReference;

  PublicActivityData(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.iconReference});
}
