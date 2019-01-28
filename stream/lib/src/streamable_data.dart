import 'package:uuid/uuid.dart';

abstract class StreamableData {
  final String _uuid = Uuid().v4();
  final String _customKey;

  bool hidden;

  String get key => _customKey ?? _uuid;

  StreamableData({String key, bool hidden = false})
      : _customKey = key,
        hidden = hidden;
}
