import 'package:stream/streamable_data.dart';

class StreamableTableRowData extends StreamableData {
  StreamableTableRowData({String key, bool hidden})
      : super(key: key, hidden: hidden);
}
