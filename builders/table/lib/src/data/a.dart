import 'package:flutter/material.dart';
import 'package:table/index.dart';
import 'package:decorated_text/index.dart';
import 'package:sorting/index.dart';
import 'package:standard_icon_library/index.dart';

class CellAData extends StreamableTableRowData with TimeSortable {
  final WeightDecoratedText title;
  final String description;
  final StandardIcon iconReference;
  final int section;
  final int timestamp;

  CellAData({
    @required this.title,
    @required this.description,
    @required this.iconReference,
    @required this.timestamp,
    int section,
    String key,
  })  : section = section ?? 0,
        super(key: key);
}
