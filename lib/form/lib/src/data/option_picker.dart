import 'option_picker_data.dart';
import 'picker_field.dart';

class FormOptionPickerFieldData<T>
    extends PickerFieldData<List<FormOptionPickerData<T>>> {
  String emptyText;
  List<FormOptionPickerData<T>> selectedOptions;
  List<FormOptionPickerData<T>> options;
  bool isMultiSelect;

  FormOptionPickerFieldData({
    this.emptyText = "Nothing selected",
    this.options,
    this.isMultiSelect,
    String title,
    List<FormOptionPickerData<T>> selectedOptions,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          initialValue: selectedOptions,
          size: size,
          isVisible: isVisible,
        );
}
