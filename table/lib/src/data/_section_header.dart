import 'package:stream/index.dart';

class StreamableTableSectionHeaderData extends StreamableData {
  final String title;
  final bool pinned;
  final bool floating;

  StreamableTableSectionHeaderData({this.title, bool pinned, bool floating})
      : pinned = pinned ?? false,
        floating = floating ?? false;
}
