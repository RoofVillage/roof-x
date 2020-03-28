import 'package:period_type/index.dart';
import 'package:frequency_type/index.dart';

class LeasePreview {
  final String name;
  final double amount;
  final PeriodType period;
  final FrequencyType frequency;
  final DateTime start;
  final DateTime end;

  LeasePreview({
    this.name,
    this.amount,
    this.period,
    this.frequency,
    this.start,
    this.end,
  });
}
