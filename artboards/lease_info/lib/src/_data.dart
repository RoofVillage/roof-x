import 'package:period_type/index.dart';
import 'package:fee_payer_type/index.dart';

mixin LeaseInfoArtboardData {
  String get leaseTitle;
  String get homeTitle;
  int get totalAmount;
  PeriodType get frequency;
  int get interval;
  int get dueDay;
  int get startTimestamp;
  int get endTimestamp;
  bool get continueInvoices;
  String get paymentProfile;
  int get lateFeeAmount;
  int get daysUntilLateFee;
  FeePayerType get feePayer;
}