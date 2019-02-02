import 'package:flutter/material.dart';
import 'package:decorated_text/index.dart';
import 'package:table/index.dart';
import 'package:icon_library/index.dart';
import 'package:sorting/index.dart';

class PublicActivityData extends StreamableTableRowData with TimeSortable {
  final WeightDecoratedText title;
  final String description;
  final StandardIconReference iconReference;
  final PublicActivityType type;
  final int timestamp;

  PublicActivityData(
      {@required this.title,
      @required this.description,
      @required this.iconReference,
      @required this.type,
      @required this.timestamp,
      String key})
      : super(key: key);
}

enum PublicActivityType {
  completion,
  expense,
  transfer,
  landlordTransfer,
  maintenance
}
