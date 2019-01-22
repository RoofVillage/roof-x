import 'package:stream/streamable_data.dart';

class StreamableAppStateData extends StreamableData {
  bool isInSession;
  StreamableAppStateData({
    this.isInSession = false,
    String key,
  }) : super(key: key);
}
