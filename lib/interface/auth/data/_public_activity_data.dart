import 'package:flutter/material.dart';

import 'package:roofui_kit/util/roofui_decorated_text.dart';
import 'package:roofui_kit/util/roofui_icon_reference.dart';
import 'package:roofui_kit/stream/roofui_streamable_data.dart';

class PublicActivityData implements RoofUIStreamableData {
  String id;
  final RoofUIWeightDecoratedText title;
  final String description;
  final RoofUISmallIconReference iconReference;

  PublicActivityData(
      {this.id,
      @required this.title,
      @required this.description,
      @required this.iconReference});
}
