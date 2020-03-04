import 'package:intl/intl.dart';

class Date extends DateTime {
  int get secondsSinceEpoch => (millisecondsSinceEpoch * 0.01).floor();

  String get toAbbreviatedString {
    final formatter = DateFormat("MMM d");
    return formatter.format(this);
  }

  String get toLongMonthAbbreviatedString {
    final formatter = DateFormat("MMMM d");
    return formatter.format(this);
  }

  String get toAbbreviatedTimeString {
    final formatter = DateFormat("MMM d h:mm a");
    return formatter.format(this);
  }

  String get toFullDigits {
    final formatter = DateFormat("M/d/yy");
    return formatter.format(this);
  }

  String get toLongString {
    final formatter = DateFormat("MMM d, yyyy");
    return formatter.format(this);
  }

  String get toSinceString {
    final difference = DateTime.now().difference(this);
    if (difference.inDays > 0) {
      return "${difference.inDays}d";
    } else if (difference.inHours > 0) {
      return "${difference.inHours}h";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes}m";
    }
    return "just now";
  }

  String get toDueString {
    final difference = this.difference(DateTime.now());
    final dayNoun = difference.inDays == 1 ? "day" : "days";
    final hourNoun = difference.inHours == 1 ? "hour" : "hours";
    final minuteNoun = difference.inMinutes == 1 ? "minute" : "minutes";
    if (difference.inDays > 0) {
      return "${difference.inDays} $dayNoun";
    } else if (difference.inHours > 0) {
      return "${difference.inHours} $hourNoun";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} $minuteNoun";
    }

    final overdueDifference = -difference;

    String overdueString;
    if (overdueDifference.inDays > 0) {
      overdueString = "${overdueDifference.inMinutes} $dayNoun";
    } else if (overdueDifference.inHours > 0) {
      overdueString = "${overdueDifference.inHours} $hourNoun";
    } else if (overdueDifference.inMinutes > 0) {
      overdueString = "${overdueDifference.inMinutes} $minuteNoun";
    } else {
      return "overdue";
    }

    return overdueString + " overdue";
  }

  String get toAbbreviatedScheduleString {
    if (isToday) {
      return "Today";
    } else if (isTomorrow) {
      return "Tomorrow";
    }
    return toScheduleString;
  }

  String get toScheduleString {
    final formatter = DateFormat("cccc, LLL d");
    return formatter.format(this);
  }

  String get toAgoString {
    final difference = DateTime.now().difference(this);
    if (difference.inMinutes > 0) {
      return toSinceString + " ago";
    }
    return "just now";
  }

  String get toAdaptiveString {
    final difference = DateTime.now().difference(this);
    if (difference.inDays > 365) {
      return toLongString;
    } else if (difference.inDays > 6) {
      return toAbbreviatedString;
    } else if (isYesterday) {
      final formatter = DateFormat("h:mm a");
      return "yesterday " + formatter.format(this);
    } else if (difference.inDays >= 1) {
      final formatter = DateFormat("cccc");
      return formatter.format(this);
    } else if (difference.inHours > 0) {
      final formatter = DateFormat("h:mm a");
      return formatter.format(this);
    } else {
      return toAgoString;
    }
  }

  String get toPastDistanceSentenceString {
    if (isToday) {
      final formatter = DateFormat("h:mm a");
      return "at " + formatter.format(this);
    } else if (isYesterday) {
      return "yesterday";
    } else {
      final difference = DateTime.now().difference(this);
      final noun = difference.inDays == 1 ? "day" : "days";
      return "${difference.inDays} $noun ago";
    }
  }

  bool get isToday {
    final localNow = DateTime.now().toLocal();
    return this.toLocal().weekday == localNow.weekday &&
        this.difference(localNow).inDays.abs() < 1;
  }

  bool get isTomorrow {
    final localNow = DateTime.now().toLocal();
    final weekdayDifference = this.toLocal().weekday - localNow.weekday;
    final oneWeekdayApart = weekdayDifference == 1 || weekdayDifference == -6;

    return oneWeekdayApart && this.difference(localNow).inDays.abs() < 2;
  }

  bool get isYesterday {
    final localNow = DateTime.now().toLocal();
    final weekdayDifference = -(this.toLocal().weekday - localNow.weekday);
    final oneWeekdayApart = weekdayDifference == 1 || weekdayDifference == -6;

    return oneWeekdayApart && this.difference(localNow).inDays.abs() < 2;
  }

  Date.fromSecondsSinceEpoch(int seconds)
      : super.fromMillisecondsSinceEpoch(seconds * 1000);

  Date.fromDateTime(DateTime dateTime)
      : super.fromMillisecondsSinceEpoch(dateTime.millisecondsSinceEpoch);

  Date.now() : super.now();
}
