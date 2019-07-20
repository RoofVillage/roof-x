import 'package:form/src/data/field.dart';

import '_mixins/on_tap_listener_adder.dart';
import '../options/labeled_value.dart';

class FormOptionPickerFieldData<T>
    extends StreamableFormFieldData<List<FormLabeledValue<T>>>
    with OnTapListenerAdder {
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
