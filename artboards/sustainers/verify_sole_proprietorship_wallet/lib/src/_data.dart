import 'package:flutter/material.dart';
import 'package:form_builder/index.dart';

mixin VerifySoleProprietorshipWalletArtboardData implements FormBuilder {
  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async => [
        _firstName,
        _lastName,
        _email,
        _address1,
        _address2,
        _city,
        _state,
        _postalCode,
        _dob,
        _last4Ssn,
      ];

  Future<void> submit(BuildContext context) {
    // TODO: implement submit
    return null;
  }

  final _firstName = FormShortTextFieldData(
    title: "First name",
    placeholder: "John",
    isRequired: true,
  );
  final _lastName = FormShortTextFieldData(
    title: "Last name",
    placeholder: "Boner",
    isRequired: true,
  );
  final _email = FormEmailTextFieldData(
    title: "Email",
    isRequired: true,
  );
  final _address1 = FormShortTextFieldData(
    title: "Street address",
    placeholder: "123 Your St.",
    isRequired: true,
  );
  final _address2 = FormShortTextFieldData(
    title: "Street address 2",
    placeholder: "Apt 420"
  );
  final _city = FormShortTextFieldData(
    title: "City",
    placeholder: "San Francisco",
    isRequired: true,
  );
  final _state = FormShortTextFieldData(
    title: "State",
    placeholder: "CA",
    isRequired: true,
  );
  final _postalCode = FormIntegerTextFieldData(
    title: "Postal code",
    placeholder: "12345",
    isRequired: true,
  );
  final _dob = FormDatePickerFieldData(
    title: "Date of birth",
  );
  final _last4Ssn = FormShortSsnFieldData(
    title: "SSN (last 4 digits)",
    isRequired: true,
  );
}
