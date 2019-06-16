import 'package:frequency_type/index.dart';

import 'package:key/index.dart' as _key;
import 'package:mappable/index.dart';

class Schedule with Mappable {
  final FrequencyType frequencyType;
  final int interval;
  final int time;
  final Set<int> days;
  final Set<int> dates;

  Schedule(
      {this.frequencyType, this.interval, this.time, this.days, this.dates});

  factory Schedule.fromMap(Map<String, Object> map) {
    if (map == null) return null;

    return Schedule(
      frequencyType: FrequencyType.fromString(map[_key.frequencyKind]),
      interval: map[_key.interval],
      time: map[_key.time],
      days: map[_key.days],
      dates: map[_key.dates],
    );
  }

  @override
  Map<String, Object> toMap() {
    return {
      _key.frequencyKind: frequencyType.toString(),
      _key.interval: interval,
      _key.time: time,
      _key.days: days,
      _key.dates: dates
    };
  }
}
