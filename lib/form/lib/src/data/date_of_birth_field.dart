import 'package:form/index.dart';

import 'date_picker_field.dart';

class FormDateOfBirthFieldData extends FormDatePickerFieldData {
  static final _tenYearsAgo = DateTime(
    DateTime.now().year - 10,
    DateTime.now().month,
    DateTime.now().day,
  );

  FormDateOfBirthFieldData({
    DateTime initialValue,
    DateTime startBound,
    DateTime endBound,
    double size,
    bool isVisible,
    String exceptionTitle,
  }) : super(
          title: 'Date of Birth',
          initialValue: initialValue,
          size: size,
          isVisible: isVisible,
          startBound: startBound,
          endBound: endBound ?? _tenYearsAgo,
        );
}
