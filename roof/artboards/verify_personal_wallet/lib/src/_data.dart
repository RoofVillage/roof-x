import 'package:flutter/material.dart';
import 'package:form_builder/index.dart';
import 'package:labeled_value/index.dart';

mixin VerifyPersonalWalletArtboardData implements FormBuilder {
  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async => [
        _test,
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

  final _test = MetaFormFieldData(
    title: "Biz controller",
    fieldsData: Future.value(
      [
        FormShortTextFieldData(title: 'First name'),
        FormShortTextFieldData(title: 'Last name'),
        FormShortTextFieldData(title: 'Title'),
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
        // TODO: WIP
        value:
            "${controller?.firstName} x${controller?.lastName} ${controller?.title}",
      ),
    ],
  );

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
  final _address2 =
      FormShortTextFieldData(title: "Street address 2", placeholder: "Apt 420");
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

class Controller {
  final String firstName;
  final String lastName;
  final String title;
  // DateTime dateOfBirth;
  // String ssn;
  // Address address;

  Controller({
    this.firstName,
    this.lastName,
    this.title,
  });
}

class Address {
  String address1;
  String address2;
  String address3;
  String city;
  String stateProvinceRegion;
  String postalCode;
  String country;
}
