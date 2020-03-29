import 'package:form/index.dart';
import 'package:labeled_value/index.dart';
import 'package:us_state_options/index.dart';

class FormUsStateTextFieldData
    extends FormRollerColumnPickerFieldData<UsStateOption> {
  static _labeledValueFromUsStateOption(UsStateOption option) => LabeledValue(
        label: option.toAbbreviatedString(),
        value: option,
      );

  @override
  buildOptions() => UsStateOption.options.map(
        (option) => _labeledValueFromUsStateOption(option),
      );

  FormUsStateTextFieldData({
    String initialValue,
    double size,
    bool isVisible,
  }) : super(
          title: 'State',
          selectedValue: _labeledValueFromUsStateOption(
            initialValue != null
                ? UsStateOption.fromString(initialValue)
                : UsStateOption.options.first,
          ),
          size: size,
          isVisible: isVisible,
        );
}
