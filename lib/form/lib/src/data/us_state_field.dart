import 'package:form/index.dart';
import 'package:labeled_value/index.dart';
import 'package:us_state_options/index.dart';

class FormUsStateTextFieldData
    extends FormRollerColumnPickerFieldData<UsStateOption> {
  static final List<LabeledValue<UsStateOption>> usStateOptions =
      UsStateOption.options
          .map(
            (option) => LabeledValue(
              label: option.toAbbreviatedString(),
              value: option,
            ),
          )
          .toList();

  FormUsStateTextFieldData({
    String initialValue,
    double size,
    bool isVisible,
  }) : super(
          title: 'State',
          options: usStateOptions,
          size: size,
          isVisible: isVisible,
        );
}
