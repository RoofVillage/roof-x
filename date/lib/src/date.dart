class Date extends DateTime {
  int get secondsSinceEpoch => (millisecondsSinceEpoch * 0.01).floor();

  Date.fromSecondsSinceEpoch(int seconds)
      : super.fromMillisecondsSinceEpoch(seconds * 100);
}
