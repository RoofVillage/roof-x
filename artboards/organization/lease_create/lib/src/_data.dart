import 'dart:async';

import 'package:form_builder/index.dart';
import 'package:ordinal_suffix_string_from_int/index.dart';
import 'package:interval/index.dart';

mixin PropertyCreateArtboardData implements FormBuilder {
  @override
  String get title => "Add a lease";

  @override
  String get subtitle =>
      "Just a heads up—once your tenants send a rent payment, it will take another 3-6 business days before it reaches your bank account.";

  @override
  String get submitButtonText => "Create lease";

  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async => [
        _scheduleFrequency,
        _intervalFrequency,
        _dueOn,
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

  // TODO: field conditional visibility
  final _scheduleFrequency = FrequencyFormSelectFieldData(title: "Rent due");
  final _intervalFrequency = IntervalFormSelectFieldData();
  final _dueOn = FormOptionSelectFieldData(options: _buildDueOnOptions());
  final _amount = CurrencyFormTextFieldData(title: "Rent amount");
  final _startDate = FormDateFieldData(title: "Lease begins");
  final _endDate = FormDateFieldData(title: "Lease ends (optional)");
  final _pastInvoices = FormSwitchFieldData(
      title:
          "Your start date is in the past. Create invoices due earlier than today?");
  final _continue = FormSwitchFieldData(title: _getContinueString());
  final _name = ShortFormTextFieldData(title: "Lease name (optional)");
  final _rentDestination = FormOptionSelectFieldData(
    title: "Default rent destination",
    emptyText: "No payment profiles available",
    options: _getPaymentProfiles(),
  );
  final _feePayer =
      FeePayerFormSelectFieldData(title: "\$2 payment charge is covered by...");
  final _lateFee = FormSwitchFieldData(title: "Charge a late fee?");
  final _lateFeeAmount = CurrencyFormTextFieldData(title: "Late fee amount");
  final _daysUntilLateFee = IntegerFormTextFieldData(
      title: "Days before late fee charged", maxValue: 31);

  static List<FormOptionSelectValueData<int>> _buildDueOnOptions() {
    
    final List<FormOptionSelectValueData<int>> options = [];

    for (int i = 0; i < 30; i++) {
      final string = "on the ${ordinalSuffixString(i)}";
      final option = FormOptionSelectValueData<int>(title: string, data: i);
      options.add(option);
    }

    final lastOption = FormOptionSelectValueData<int>(
      title: "on the last day",
      data: 30,
    );
    options.add(lastOption);

    return options;
  }

  static List<FormOptionSelectValueData> _getPaymentProfiles() {
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
