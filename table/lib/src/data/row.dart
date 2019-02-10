import 'package:stream/index.dart';

class StreamableTableRowData extends StreamableData {
  StreamableTableRowData({String key, bool hidden})
      : super(key: key, hidden: hidden);
}
