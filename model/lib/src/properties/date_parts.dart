import '../utils/index.dart';

class DateParts extends Mappable {
  final int time;
  final int day;
  final int month;
  final int year;

  DateParts({this.time, this.day, this.month, this.year});

  factory DateParts.fromMap(Map<String, Object> map) {
    return DateParts(
        time: map[Key.time],
        day: map[Key.day],
        month: map[Key.month],
        year: map[Key.year]);
  }

  @override
  Map<String, Object> toMap() {
    return {Key.time: time, Key.day: day, Key.month: month, Key.year: year};
  }
}
