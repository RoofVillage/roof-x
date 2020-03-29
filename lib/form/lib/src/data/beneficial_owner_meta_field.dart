import 'package:dwolla_model/index.dart';
import 'package:form/index.dart';
import 'package:form/src/data/date_of_birth_field.dart';
import 'package:labeled_value/index.dart';

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
      _valueFromFieldsData =
      (List<StreamableFormFieldData<dynamic>> fieldsData) => BeneficialOwner(
            firstName: (fieldsData[0] as FormFirstNameTextFieldData)?.value,
            lastName: (fieldsData[1] as FormLastNameTextFieldData)?.value,
            ssn: (fieldsData[2] as FormFullSsnFieldData)?.value,
            dateOfBirth: (fieldsData[3] as FormDateOfBirthFieldData)?.value,
            address: (fieldsData[4] as AddressMetaFieldData)?.value,
          );
  static final List<LabeledValue<String>> Function(BeneficialOwner)
      _labeledValuesFromValue = (BeneficialOwner beneficialOwner) => [
            LabeledValue(
              label: 'Name',
              value:
                  '${beneficialOwner?.firstName} ${beneficialOwner?.lastName}',
            )
          ];

  BeneficialOwnerMetaFieldData({
    BeneficialOwner initialValue,
    bool isRequired,
    bool isVisible,
  }) : super(
          title: 'Beneficial Owner',
          initialValue: initialValue,
          fieldsData: _fieldsData(initialValue, isRequired ?? false),
          valueFromFieldsData: _valueFromFieldsData,
          labeledValuesFromValue: _labeledValuesFromValue,
          isVisible: isVisible,
        );
}
