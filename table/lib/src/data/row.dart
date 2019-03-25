import 'package:stream/index.dart';

class StreamableTableRowData extends StreamableData {
  StreamableTableRowData({String key, bool isHidden})
      : super(key: key, isHidden: isHidden);
}
