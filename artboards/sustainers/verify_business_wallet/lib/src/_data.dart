import 'package:flutter/material.dart';
import 'package:form_builder/index.dart';
import 'package:dwolla_model/index.dart';
import 'package:labeled_value/index.dart';

mixin VerifyBusinessWalletArtboardData implements FormBuilder {
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
        _controller,
        _beneficialOwnerDocument,
      ];

  Future<void> submit(BuildContext context) {
    // TODO: implement submit
    return null;
  }

  final _firstName = FormFirstNameTextFieldData(
    isRequired: true,
  );
  final _lastName = FormLastNameTextFieldData(
    isRequired: true,
  );
  final _email = FormEmailTextFieldData(
    isRequired: true,
  );
  final _address1 = FormAddressTextFieldData(
    isRequired: true,
  );
  final _address2 = FormAddress2TextFieldData();
  final _city = FormCityTextFieldData(
    isRequired: true,
  );
  final _state = FormUsStateTextFieldData();
  final _postalCode = FormUsZipCodeTextFieldData(
    isRequired: true,
  );
  final _dob = FormDateOfBirthFieldData();
  final _last4Ssn = FormShortSsnFieldData(
    isRequired: true,
  );
  final _controller = ControllerMetaFieldData(isRequired: true);
  final _beneficialOwnerDocument = BeneficialOwnerMetaFieldData();
}
