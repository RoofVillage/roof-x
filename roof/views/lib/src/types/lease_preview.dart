import 'package:views/src/types/period.dart';

/// deprecated. use ~/types
@deprecated
class LeasePreview {
  final String name;
  final double amount;
  // TODO period (biweekly, daily etc)
  final Period period;
  final DateTime start;
  final DateTime end;

  LeasePreview({
    this.name,
    this.amount,
    this.period,
    this.start,
    this.end,
  });
}
