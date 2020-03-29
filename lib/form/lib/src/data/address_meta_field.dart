import 'package:dwolla_model/index.dart';
import 'package:form/index.dart';
import 'package:labeled_value/index.dart';

import 'meta_form_field.dart';

class AddressMetaFieldData extends MetaFormFieldData<Address> {
  static _address1(String initialValue, bool isRequired) =>
      FormAddressTextFieldData(
        initialValue: initialValue,
        isRequired: isRequired,
      );
  static _address2(String initialValue) => FormAddress2TextFieldData(
        initialValue: initialValue,
      );
  static _city(String initialValue, bool isRequired) => FormCityTextFieldData(
        initialValue: initialValue,
        isRequired: isRequired,
      );
  static _state(String initialValue) => FormUsStateTextFieldData(
        initialValue: initialValue,
      );
  static _postalCode(String initialValue, bool isRequired) =>
      FormUsZipCodeTextFieldData(
        initialValue: initialValue,
        isRequired: isRequired,
      );
  static Future<List<StreamableFormFieldData>> _fieldsData(
    Address initialValue,
    bool isRequired,
  ) =>
      Future.value([
        _address1(initialValue?.address1, isRequired),
        _address2(initialValue?.address2),
        _city(initialValue?.city, isRequired),
        _state(initialValue?.stateProvinceRegion),
        _postalCode(initialValue?.postalCode, isRequired),
      ]);
  static final Address Function(List<StreamableFormFieldData>)
      _valueFromFieldsData = (
    List<StreamableFormFieldData> fieldsData,
  ) =>
          Address(
            address1: (fieldsData[0] as FormAddressTextFieldData)?.value,
            address2: (fieldsData[1] as FormAddress2TextFieldData)?.value,
            city: (fieldsData[2] as FormCityTextFieldData)?.value,
            stateProvinceRegion: (fieldsData[3] as FormUsStateTextFieldData)
                ?.value
                ?.value
                ?.toAbbreviatedString(),
            postalCode: (fieldsData[4] as FormUsZipCodeTextFieldData)?.value,
            country: 'US',
          );

  static final List<LabeledValue<String>> Function(Address)
      _labeledValuesFromValue = (Address address) {
    final labeledValues = <LabeledValue<String>>[
      LabeledValue(
        label: 'Address',
        value: address?.address1 ?? 'No address',
      )
    ];
    if (address?.address2 != null) {
      labeledValues.add(
        LabeledValue(value: address.address2),
      );
    }
    if (address?.city != null) {
      labeledValues.add(
        LabeledValue(value: address.city),
      );
    }
    if (address?.stateProvinceRegion != null) {
      labeledValues.add(
        LabeledValue(value: address.stateProvinceRegion),
      );
    }
    return labeledValues;
  };

  AddressMetaFieldData({
    Address initialValue,
    bool isRequired,
    bool isVisible,
  }) : super(
          title: 'Address',
          initialValue: initialValue,
          fieldsData: _fieldsData(initialValue, isRequired ?? false),
          valueFromFieldsData: _valueFromFieldsData,
          labeledValuesFromValue: _labeledValuesFromValue,
          isVisible: isVisible,
        );
}
