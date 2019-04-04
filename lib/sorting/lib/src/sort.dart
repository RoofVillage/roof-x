import 'mixins/index.dart';

int revCron(TimeSortable a, TimeSortable b) =>
    a.timestamp > b.timestamp ? -1 : 1;

int cron(TimeSortable a, TimeSortable b) => a.timestamp < b.timestamp ? -1 : 1;
