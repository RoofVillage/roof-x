import 'package:flutter/material.dart';

import './_row.dart';

class TimeSortableStreamableTableRowData extends StreamableTableRowData {
  final int timestamp;

  TimeSortableStreamableTableRowData({@required this.timestamp, String key})
      : super(key: key);
}
