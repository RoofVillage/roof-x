class Date extends DateTime {
  int get secondsSinceEpoch => (millisecondsSinceEpoch * 0.01).floor();

  String get toAbbreviatedString => "Feb 02";
  String get toLongString => "Feb 02";
  Date.fromSecondsSinceEpoch(int seconds)
      : super.fromMillisecondsSinceEpoch(seconds * 100);
}
