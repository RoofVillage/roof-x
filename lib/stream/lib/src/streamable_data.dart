import 'package:uuid/uuid.dart';

abstract class StreamableData {
  final String _uuid = Uuid().v4();
  final String _customKey;

  String get key => _customKey ?? _uuid;

  StreamableData({String key}) : _customKey = key;
}
