import 'option_select_value.dart';
import 'picker_field.dart';

class FormOptionSelectFieldData<T>
    extends PickerFieldData<List<FormOptionSelectValueData<T>>> {
  String emptyText;
  List<FormOptionSelectValueData<T>> selectedOptions;
  List<FormOptionSelectValueData<T>> options;
  bool isMultiSelect;

  FormOptionSelectFieldData({
    this.emptyText = "Nothing selected",
    this.options,
    this.isMultiSelect,
    String title,
    List<FormOptionSelectValueData<T>> selectedOptions,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          initialValue: selectedOptions,
          size: size,
          isVisible: isVisible,
        );
}
