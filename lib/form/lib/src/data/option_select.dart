import 'field.dart';
import 'option_select_value.dart';

class FormOptionSelectData
    extends StreamableFormFieldData<List<FormOptionSelectValueData>> {
  String emptyText;
  List<FormOptionSelectValueData> options;
  bool isMultiSelect;

  FormOptionSelectData({
    this.emptyText = "Nothing selected",
    this.options,
    this.isMultiSelect = false,
    String title,
    List<FormOptionSelectValueData> initialValue,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          initialValue: initialValue,
          size: size,
          isVisible: isVisible,
        );
}
