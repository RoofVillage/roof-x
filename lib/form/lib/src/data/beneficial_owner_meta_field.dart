import 'package:dwolla_model/index.dart';
import 'package:form/index.dart';
import 'package:form/src/data/date_of_birth_field.dart';

import 'meta_form_field.dart';

class BeneficialOwnerMetaFieldData extends MetaFormFieldData<BeneficialOwner> {
  static _firstName(String initialValue, bool isRequired) =>
      FormFirstNameTextFieldData(
        initialValue: initialValue,
        isRequired: isRequired,
      );
  static _lastName(String initialValue, bool isRequired) =>
      FormLastNameTextFieldData(
        initialValue: initialValue,
        isRequired: isRequired,
      );
  static _ssn(String initialValue, bool isRequired) => FormFullSsnFieldData(
        initialValue: initialValue,
        isRequired: isRequired,
      );
  static _dateOfBirth(DateTime initialValue) => FormDateOfBirthFieldData(
        initialValue: initialValue,
      );
  static _address(Address initialValue, bool isRequired) =>
      AddressMetaFieldData(
        initialValue: initialValue,
        isRequired: isRequired,
      );
  static Future<List<StreamableFormFieldData>> _fieldsData(
    BeneficialOwner initialValue,
    bool isRequired,
  ) =>
      Future.value([
        _firstName(initialValue?.firstName, isRequired),
        _lastName(initialValue?.lastName, isRequired),
        _ssn(initialValue?.ssn, isRequired),
        _dateOfBirth(initialValue?.dateOfBirth),
        _address(initialValue?.address, isRequired),
      ]);
  static final BeneficialOwner Function(List<StreamableFormFieldData<dynamic>>)
      _valueFromFieldsData = (
    List<StreamableFormFieldData<dynamic>> fieldsData,
  ) =>
          BeneficialOwner(
            firstName: (fieldsData[0] as FormFirstNameTextFieldData)?.value,
            lastName: (fieldsData[1] as FormLastNameTextFieldData)?.value,
            ssn: (fieldsData[2] as FormFullSsnFieldData)?.value,
            dateOfBirth: (fieldsData[3] as FormDateOfBirthFieldData)?.value,
            address: (fieldsData[4] as AddressMetaFieldData)?.value,
          );
          
  static final List<String> Function(BeneficialOwner) _displayValues =
      (BeneficialOwner beneficialOwner) {
    if (beneficialOwner?.firstName == null && beneficialOwner?.lastName == null)
      return [];

    String nameString = beneficialOwner?.firstName ?? '';
    if (beneficialOwner?.lastName != null) {
      nameString += nameString.isNotEmpty ? ' ' : '';
      nameString += beneficialOwner.lastName;
    }

    return [nameString];
  };

  BeneficialOwnerMetaFieldData({
    BeneficialOwner initialValue,
    bool isRequired,
    bool isRemovable,
    bool isVisible,
  }) : super(
          title: 'Business Owner',
          initialValue: initialValue,
          fieldsData: _fieldsData(initialValue, isRequired ?? false),
          valueFromFieldsData: _valueFromFieldsData,
          displayValues: _displayValues,
          isVisible: isVisible,
          isRemovable: isRemovable,
        );
}
