import 'package:period_type/index.dart';

String toIntervalFrequencyString(int interval, String frequency,
    {bool capitalize}) {
  final String frequencyString =
      PeriodType.fromString(frequency).inlineString;

  String string;
  switch (interval) {
    case 0:
      string = "$frequencyString-to-$frequencyString";
      break;
    case 1:
      string = "bi-$frequency";
      break;
    default:
      string = "every $interval ${frequency}s";
      break;
  }

  if (capitalize ?? false)
    return string[0].toUpperCase() + string.substring(1);
  else
    return string;
}
