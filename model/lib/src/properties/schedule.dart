import 'package:types/index.dart';
import '../utils/index.dart';

class Schedule extends Mappable {
  final FrequencyType frequencyType;
  final int interval;
  final int time;
  final List<int> days;
  final List<int> dates;

  Schedule(
      {this.frequencyType, this.interval, this.time, this.days, this.dates});

  factory Schedule.fromMap(Map<String, Object> map) {
    final frequencyType = FrequencyType.values.firstWhere((value) =>
        value.toString() == 'FrequencyType.' + map[Key.frequencyKind]);

    return Schedule(
        frequencyType: frequencyType,
        interval: map[Key.interval],
        time: map[Key.time],
        days: map[Key.days],
        dates: map[Key.dates]);
  }

  @override
  Map<String, Object> toMap() {
    return {
      Key.frequencyKind: frequencyType.toString().split(".").last,
      Key.interval: interval,
      Key.time: time,
      Key.days: days,
      Key.dates: dates
    };
  }
}
