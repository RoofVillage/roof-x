import 'package:stream/index.dart';

class StreamableFormSectionHeaderData extends StreamableData {
  String title;
  String subtitle;

  StreamableFormSectionHeaderData({
    this.title,
    this.subtitle,
  });
}
