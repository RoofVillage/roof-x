import '../options/titled_value.dart';
import 'picker_field.dart';

class FormOptionPickerFieldData<T>
    extends FormPickerFieldData<List<FormTitledValue<T>>> {
  String emptyText;
  List<FormTitledValue<T>> selectedOptions;
  List<FormTitledValue<T>> options;
  bool isMultiSelect;

  FormOptionPickerFieldData({
    this.emptyText = "Nothing selected",
    this.options,
    this.isMultiSelect,
    String title,
    List<FormTitledValue<T>> selectedOptions,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          initialValue: selectedOptions,
          size: size,
          isVisible: isVisible,
        );
}
