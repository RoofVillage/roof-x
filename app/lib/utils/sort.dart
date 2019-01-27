import 'package:table/index.dart';

class Sort {
  static int revCron(TimeSortableStreamableTableRowData a,
          TimeSortableStreamableTableRowData b) =>
      a.timestamp > b.timestamp ? -1 : 1;

  static int cron(TimeSortableStreamableTableRowData a,
          TimeSortableStreamableTableRowData b) =>
      a.timestamp < b.timestamp ? -1 : 1;
}
