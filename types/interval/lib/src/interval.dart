class IntervalString {
  static String fromInt(int interval) {
    switch (interval) {
      case 0:
        return "every";
      case 1:
        return "every other";
      case 2:
        return "every third";
      default:
        if (interval <= 20) return "${interval}th";
    }
    return null;
  }
}
