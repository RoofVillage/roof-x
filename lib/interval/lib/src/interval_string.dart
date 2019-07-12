import 'package:ordinal_suffix_string_from_int/index.dart';

String toIntervalString(int interval, {bool capitalize}) {
  final String ordinalSuffix = ordinalSuffixString(interval);

  String string;
  switch (interval) {
    case 0:
      string = "every";
      break;
    case 1:
      string = "every other";
      break;
    case 2:
      string = "every third";
      break;
    default:
      string = "every $interval$ordinalSuffix";
      break;
  }

  if (capitalize ?? false)
    return string[0].toUpperCase() + string.substring(1);
  else
    return string;
}
