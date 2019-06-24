import 'field.dart';
import 'option_select_value.dart';

class FormOptionSelectData<T>
    extends StreamableFormFieldData<List<FormOptionSelectValueData<T>>> {
  String emptyText;
  List<FormOptionSelectValueData<T>> options;
  bool isMultiSelect;

  FormOptionSelectData({
    this.emptyText = "Nothing selected",
    this.options,
    this.isMultiSelect,
    String title,
    List<FormOptionSelectValueData<T>> initialValue,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          initialValue: initialValue,
          size: size,
          isVisible: isVisible,
        );
}
