import 'package:uuid/uuid.dart';

abstract class StreamableData {
  final String _uuid = Uuid().v4();
  final String _customKey;
  bool isVisible;

  String get key => _customKey ?? _uuid;

  StreamableData({String key, bool isVisible})
      : _customKey = key,
        isVisible = isVisible ?? true;
}
