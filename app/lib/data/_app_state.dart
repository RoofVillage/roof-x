import 'package:stream/index.dart';
import 'package:spec/theme.dart';

class StreamableAppStateData extends StreamableData {
  bool isInSession;
  // RoofThemeOption theme;

  StreamableAppStateData({
    this.isInSession = false,
    // this.theme = RoofThemeOption.light,
    String key,
  }) : super(key: key);
}
