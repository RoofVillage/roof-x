enum LeaseStatusOption { active, upcoming, ended }

class LeaseStatus {
  static LeaseStatusOption fromLease(int startTimestamp, int endTimestamp) {
    final nowTimestamp = DateTime.now().millisecondsSinceEpoch / 1000;

    if (endTimestamp < nowTimestamp) {
      return LeaseStatusOption.ended;
    } else if (startTimestamp > nowTimestamp) {
      return LeaseStatusOption.upcoming;
    } else
      return LeaseStatusOption.active;
  }
}
