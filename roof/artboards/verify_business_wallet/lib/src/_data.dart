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
    placeholder: "Apt 420",
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
  final _controller = MetaFormFieldData(
    title: "Controller",
    fieldsData: Future.value(
      [
        FormShortTextFieldData(
          title: 'First name',
          isRequired: true,
        ),
        FormShortTextFieldData(
          title: 'Last name',
          isRequired: true,
        ),
        FormShortTextFieldData(
          title: 'Title',
          isRequired: true,
        ),
        // TODO date select
        FormShortTextFieldData(
          title: 'Date of Birth',
          isRequired: true,
        ),
        FormShortTextFieldData(
          title: 'SSN (last 4 digits)',
          isRequired: true,
        ),
        FormShortTextFieldData(
          title: 'Address',
          isRequired: true,
        ),
        FormShortTextFieldData(
          title: 'Address 2',
        ),
        FormShortTextFieldData(
          title: 'Address 3',
        ),
        FormShortTextFieldData(
          title: 'City',
          isRequired: true,
        ),
        FormShortTextFieldData(
          title: 'State',
          isRequired: true,
        ),
        FormShortTextFieldData(
          title: 'Postal Code',
          isRequired: true,
        ),
      ],
    ),
    valueFromFieldsData: (data) => Controller(
      firstName: data[0].value,
      lastName: data[1].value,
      title: data[2].value,
    ),
    labeledValuesFromValue: (controller) => [
      LabeledValue(
        label: 'Name',
        value: "${controller?.firstName} ${controller?.lastName}",
      ),
    ],
  );
  final _beneficialOwnerDocument = MetaFormFieldData<BeneficialOwner>(
    title: "Beneficial Owner",
    fieldsData: Future.value(
      [
        FormShortTextFieldData(
          title: 'First name',
          isRequired: true,
        ),
        FormShortTextFieldData(
          title: 'Last name',
          isRequired: true,
        ),
        FormShortTextFieldData(
          title: 'SSN (last 4 digits)',
          isRequired: true,
        ),
        FormShortTextFieldData(
          title: 'Date of Birth',
          isRequired: true,
        ),
        FormShortTextFieldData(
          title: 'Address',
          isRequired: true,
        ),
        FormShortTextFieldData(
          title: 'Address 2',
        ),
        FormShortTextFieldData(
          title: 'Address 3',
        ),
        FormShortTextFieldData(
          title: 'City',
          isRequired: true,
        ),
        FormShortTextFieldData(
          title: 'State',
          isRequired: true,
        ),
        FormShortTextFieldData(
          title: 'Postal Code',
          isRequired: true,
        ),
      ],
    ),
    valueFromFieldsData: (data) => BeneficialOwner(
      firstName: data[0].value,
      lastName: data[1].value,
      ssn: data[2].value,
      dateOfBirth: data[3].value,
      address: Address(
        address1: data[4].value,
        address2: data[5].value,
        address3: data[6].value,
        city: data[7].value,
        stateProvinceRegion: data[8].value,
        postalCode: data[9].value,
      ),
    ),
    labeledValuesFromValue: (beneficialOwner) => [
      LabeledValue(
        label: 'Name',
        value: "${beneficialOwner?.firstName} ${beneficialOwner?.lastName}",
      ),
    ],
  );
}
