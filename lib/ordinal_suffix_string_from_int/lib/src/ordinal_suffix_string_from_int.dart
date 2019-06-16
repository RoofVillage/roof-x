String ordinalSuffixString(int integer) {
  String suffix;

  if (integer.toString().endsWith("1"))
    suffix = "st";
  else if (integer.toString().endsWith("2"))
    suffix = "nd";
  else if (integer.toString().endsWith("3"))
    suffix = "rd";
  else
    suffix = "th";

  return integer.toString() + suffix;
}
