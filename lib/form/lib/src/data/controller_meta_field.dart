import 'package:dwolla_model/index.dart';
import 'package:form/index.dart';
import 'package:form/src/data/date_of_birth_field.dart';

import 'meta_form_field.dart';

class ControllerMetaFieldData extends MetaFormFieldData<Controller> {
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
  static _title(String initialValue, bool isRequired) => FormShortTextFieldData(
        title: 'Title',
        placeholder: 'CEO',
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
    Controller initialValue,
    bool isRequired,
  ) =>
      Future.value([
        _firstName(initialValue?.firstName, isRequired),
        _lastName(initialValue?.lastName, isRequired),
        _title(initialValue?.title, isRequired),
        _dateOfBirth(initialValue?.dateOfBirth),
        _address(initialValue?.address, isRequired),
      ]);
  static final Controller Function(List<StreamableFormFieldData<dynamic>>)
      _valueFromFieldsData =
      (List<StreamableFormFieldData<dynamic>> fieldsData) => Controller(
            firstName: (fieldsData[0] as FormFirstNameTextFieldData)?.value,
            lastName: (fieldsData[1] as FormLastNameTextFieldData)?.value,
            title: (fieldsData[2] as FormShortTextFieldData)?.value,
            dateOfBirth: (fieldsData[3] as FormDateOfBirthFieldData)?.value,
            address: (fieldsData[4] as AddressMetaFieldData)?.value,
          );
  static final List<String> Function(Controller) _displayValues = (
    Controller controller,
  ) {
    if (controller?.firstName == null && controller?.lastName == null)
      return [];

    String nameString = controller?.firstName ?? '';
    if (controller?.lastName != null) {
      nameString += nameString.isNotEmpty ? ' ' : '';
      nameString += controller.lastName;
    }

    return [nameString];
  };

  ControllerMetaFieldData({
    Controller initialValue,
    bool isRequired,
    bool isVisible,
  }) : super(
          title: 'Business Controller',
          initialValue: initialValue,
          fieldsData: _fieldsData(initialValue, isRequired ?? false),
          valueFromFieldsData: _valueFromFieldsData,
          displayValues: _displayValues,
          isVisible: isVisible,
        );
}
