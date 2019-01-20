import 'package:flutter/material.dart';

import 'package:roofui_kit/util/roofui_decorated_text.dart';
import 'package:roofui_kit/util/roofui_asset_reference.dart';
import 'package:roofui_kit/stream/roofui_streamable_data.dart';

class PublicActivityData extends RoofUIStreamableData with TimeSortable {
  final RoofUIWeightDecoratedText title;
  final String description;
  final RoofUISmallAssetReference assetReference;
  final PublicActivityType type;

  PublicActivityData(
      {@required this.title,
      @required this.description,
      @required this.assetReference,
      @required this.type,
      id})
      : super(id: id);
}

enum PublicActivityType {
  completion,
  expense,
  transfer,
  landlordTransfer,
  maintenance
}

class TimeSortable {
  int timestamp;
}

class Compare {
  static bool revCron(TimeSortable a, TimeSortable b) =>
      a.timestamp > b.timestamp;
}
