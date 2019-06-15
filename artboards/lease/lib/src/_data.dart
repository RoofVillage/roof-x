mixin LeaseArtboardBuilder {
  String get leaseTitle;
  String get homeTitle;
  int get totalAmount;
  // TODO implement due schedule data model (every, every other, week, month, etc)
  String get dueSchedule;
  int get startTimestamp;
  int get endTimestamp;
  bool get continueInvoices;
  String get paymentProfile;
  int get lateFeeAmount;
  int get daysUntilLateFee;
  String get transactionFee;
}