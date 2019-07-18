import '../options/labeled_value.dart';
import 'picker_field.dart';

class FormOptionPickerFieldData<T>
    extends FormPickerFieldData<List<FormLabeledValue<T>>> {
  String emptyText;
  List<FormLabeledValue<T>> selectedOptions;
  List<FormLabeledValue<T>> options;
  bool isMultiSelect;

  FormOptionPickerFieldData({
    this.emptyText = "Nothing selected",
    this.options,
    this.isMultiSelect,
    String title,
    List<FormLabeledValue<T>> selectedOptions,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          initialValue: selectedOptions,
          size: size,
          isVisible: isVisible,
        );
}
