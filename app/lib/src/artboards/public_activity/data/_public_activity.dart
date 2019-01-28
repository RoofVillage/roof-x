import 'package:flutter/material.dart';
import 'package:decorated_text/index.dart';
import 'package:table/index.dart';
import 'package:icon_library/index.dart';

class PublicActivityData extends TimeSortableStreamableTableRowData {
  final WeightDecoratedText title;
  final String description;
  final StandardIconReference iconReference;
  final PublicActivityType type;

  PublicActivityData(
      {@required this.title,
      @required this.description,
      @required this.iconReference,
      @required this.type,
      @required int timestamp,
      String key})
      : super(timestamp: timestamp, key: key);
}

enum PublicActivityType {
  completion,
  expense,
  transfer,
  landlordTransfer,
  maintenance
}
