import 'dart:async';

import 'package:form_builder/index.dart';

mixin PropertyCreateArtboardBuilder implements FormBuilder {
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

  final _scheduleFrequency = FrequencyFormSelectFieldData(title: "Rent due");
  final _intervalFrequency = IntervalFormSelectFieldData();
  final _dueOn = FormOptionSelectData(options: _buildDueOnOptions());
  final _amount = CurrencyFormTextFieldData(title: "Rent amount");
  final _startDate = FormDateFieldData(title: "Lease begins");
  final _endDate = FormDateFieldData(title: "Lease ends (optional)");
  final _pastInvoices = FormSwitchFieldData(
      title:
          "Your start date is in the past. Create invoices due earlier than today?");
  final _continue = FormSwitchFieldData(title: _getContinueString());
  final _name = ShortFormTextFieldData(title: "Lease name (optional)");
  final _rentDestination = FormOptionSelectData(
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
    _getDayStringSuffix(int day) {
      if (day.toString().endsWith("1"))
        return "st";
      else if (day.toString().endsWith("2"))
        return "nd";
      else if (day.toString().endsWith("3"))
        return "rd";
      else
        return "th";
    }

    final List<FormOptionSelectValueData<int>> options = [];

    for (int i = 0; i < 30; i++) {
      final string = "on the $i " + _getDayStringSuffix(i);
      final option = FormOptionSelectValueData<int>(title: string, data: i);
      options.add(option);
    }

    final lastOption = FormOptionSelectValueData<int>(
      title: "on the last day",
      data: 31,
    );
    options.add(lastOption);

    return options;
  }

  static List<FormOptionSelectValueData> _getPaymentProfiles() {
    // TODO
  }

  // TODO: field conditional visibility

  static String _getContinueString() {
    // TODO Return string (month-to-month, etc.) based on _scheduleFrequency and _intervalFrequency values
  }
}
