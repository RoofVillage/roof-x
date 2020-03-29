import 'package:dwolla_model/index.dart';
import 'package:form/index.dart';
import 'package:form/src/data/date_of_birth_field.dart';
import 'package:labeled_value/index.dart';

import 'meta_form_field.dart';

class BeneficialOwnerMetaFieldData extends MetaFormFieldData<BeneficialOwner> {
  static _firstName(String initialValue) => FormFirstNameTextFieldData(
        initialValue: initialValue,
        isRequired: true,
      );
  static _lastName(String initialValue) => FormLastNameTextFieldData(
        initialValue: initialValue,
        isRequired: true,
      );
  static _ssn(String initialValue) => FormFullSsnFieldData(
        initialValue: initialValue,
        isRequired: true,
      );
  static _dateOfBirth(DateTime initialValue) => FormDateOfBirthFieldData(
        initialValue: initialValue,
      );
  static _address(Address initialValue) => AddressMetaFieldData(
        initialValue: initialValue,
      );

  static _fieldsData(Controller initialValue) => Future.value([
        _firstName(initialValue.firstName),
        _lastName(initialValue.lastName),
        _ssn(initialValue.title),
        _dateOfBirth(initialValue.dateOfBirth),
        _address(initialValue.address),
      ]);

  static final BeneficialOwner Function(List<StreamableFormFieldData<dynamic>>)
      _valueFromFieldsData =
      (List<StreamableFormFieldData<dynamic>> fieldsData) => BeneficialOwner(
            firstName: (fieldsData[0] as FormFirstNameTextFieldData).value,
            lastName: (fieldsData[1] as FormLastNameTextFieldData).value,
            ssn: (fieldsData[2] as FormFullSsnFieldData).value,
            dateOfBirth: (fieldsData[3] as FormDateOfBirthFieldData).value,
            address: (fieldsData[4] as AddressMetaFieldData).value,
          );

  static final List<LabeledValue<String>> Function(BeneficialOwner)
      _labeledValuesFromValue = (BeneficialOwner beneficialOwner) {
    return [
      LabeledValue(
        label: 'Name',
        value: '${beneficialOwner.firstName} ${beneficialOwner.lastName}',
      )
    ];
  };

  BeneficialOwnerMetaFieldData({
    Controller initialValue,
    bool isVisible,
  }) : super(
          title: 'Address',
          fieldsData: _fieldsData(initialValue),
          valueFromFieldsData: _valueFromFieldsData,
          labeledValuesFromValue: _labeledValuesFromValue,
          isVisible: isVisible,
        );
}
