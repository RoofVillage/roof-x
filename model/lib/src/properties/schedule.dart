import 'package:types/index.dart';
import '../utils/index.dart';

class Schedule extends Mappable {
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
        frequencyType: FrequencyType.fromString(map[Key.frequencyKind]),
        interval: map[Key.interval],
        time: map[Key.time],
        days: map[Key.days],
        dates: map[Key.dates]);
  }

  @override
  Map<String, Object> toMap() {
    return {
      Key.frequencyKind: frequencyType.toString(),
      Key.interval: interval,
      Key.time: time,
      Key.days: days,
      Key.dates: dates
    };
  }
}
