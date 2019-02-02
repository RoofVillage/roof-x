import 'time_sortable.dart';

class Sort {
  static int revCron(TimeSortable a, TimeSortable b) =>
      a.timestamp > b.timestamp ? -1 : 1;

  static int cron(TimeSortable a, TimeSortable b) =>
      a.timestamp < b.timestamp ? -1 : 1;
}
