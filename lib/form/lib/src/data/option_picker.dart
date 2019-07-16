import '../options/titled_option_data.dart';
import 'picker_field.dart';

class FormOptionPickerFieldData<T>
    extends PickerFieldData<List<FormTitledOptionData<T>>> {
  String emptyText;
  List<FormTitledOptionData<T>> selectedOptions;
  List<FormTitledOptionData<T>> options;
  bool isMultiSelect;

  FormOptionPickerFieldData({
    this.emptyText = "Nothing selected",
    this.options,
    this.isMultiSelect,
    String title,
    List<FormTitledOptionData<T>> selectedOptions,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          initialValue: selectedOptions,
          size: size,
          isVisible: isVisible,
        );
}
