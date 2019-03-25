import 'package:uuid/uuid.dart';

abstract class StreamableData {
  final String _uuid = Uuid().v4();
  final String _customKey;

  bool isHidden;

  String get key => _customKey ?? _uuid;

  StreamableData({String key, bool isHidden})
      : _customKey = key,
        isHidden = isHidden ?? false;
}
