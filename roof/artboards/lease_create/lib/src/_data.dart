import 'dart:async';

import 'package:form_builder/index.dart';
import 'package:ordinal_suffix_string_from_int/index.dart';
import 'package:interval/index.dart';

mixin LeaseCreateArtboardData implements FormBuilder {
  @override
  String get title => "Add a lease";

  @override
  String get subtitle =>
      "Just a heads up—once your tenants send a rent payment, it will take another 3-6 business days before it reaches your bank account.";

  @override
  String get submitButtonText => "Create lease";

  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async => [
        _tagsField,
        _intervalFrequencyField,
        _dayOfMonth,
        _amount,
        _startDate,
        _endDate,
        _pastInvoices,
        _continue,
        _name,
        _rentDestination,
        _feePayer,
        _lateFee,
        _lateFeeAmount,
        _daysUntilLateFee,
      ];

  final _tagsField = FormTagFieldData(title: "Tags", placeholder: "Add a tag");

  // TODO: field conditional visibility
  final _intervalFrequencyField =
      FormIntervalFrequencyPickerFieldData(title: "Rent due", size: 2 / 3);

  final _dayOfMonth = FormDayOfMonthPickerFieldData(size: 1 / 3);

  final _dayOfWeek = FormDayOfWeekPickerFieldData(size: 1 / 3);

  final _amount = FormCurrencyTextFieldData(title: "Rent amount");

  final _startDate = FormDatePickerFieldData(title: "Lease begins");

  final _endDate = FormDatePickerFieldData(title: "Lease ends (optional)");

  final _pastInvoices = FormSwitchFieldData(
      title:
          "Your start date is in the past. Create invoices due earlier than today?");

  final _continue = FormSwitchFieldData(title: _getContinueString());

  final _name = FormShortTextFieldData(
      title: "Lease name (optional)", placeholder: "Upstairs 2019-2020");

  final _rentDestination = FormOptionPickerFieldData(
    title: "Default rent destination",
    emptyText: "No payment profiles available",
    options: _getPaymentProfiles(),
  );

  final _feePayer =
      FormFeePayerPickerFieldData(title: "\$2 payment charge is covered by...");

  final _lateFee = FormSwitchFieldData(title: "Charge a late fee?");

  final _lateFeeAmount = FormCurrencyTextFieldData(title: "Late fee amount");

  final _daysUntilLateFee = IntegerFormTextFieldData(
    title: "Days before late fee charged",
    maxValue: 31,
    initialValue: "5",
    placeholder: "5",
  );

  static List<FormLabeledValue> _buildDueOnOptions() {
    final List<FormLabeledValue> options = [];

    for (int i = 1; i < 30; i++) {
      final string = "on the ${ordinalSuffixString(i)}";
      final option = FormLabeledValue(label: string, value: i);
      options.add(option);
    }

    final lastOption = FormLabeledValue(
      label: "on the last day",
      value: 30,
    );
    options.add(lastOption);

    return options;
  }

  static List<FormLabeledValue> _getPaymentProfiles() {
    // TODO get payment profiles
  }

  static String _getContinueString() {
    // TODO get values from fields dynamically
    final int interval = 0; // Populate from form field
    final String frequency = "monthly"; // Populate from form field
    final string = toIntervalFrequencyString(interval, frequency);
    return "Continues $string";
  }
}
