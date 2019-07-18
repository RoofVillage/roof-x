import 'package:form/index.dart';
import 'package:fee_payer_type/index.dart';
import '../options/labeled_value.dart';

import 'option_picker_field.dart';

class FormFeePayerPickerFieldData extends FormOptionPickerFieldData {
  FormFeePayerPickerFieldData({
    String title,
    List<FormLabeledValue<FeePayerType>> initialValue,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          size: size,
          isVisible: isVisible,
          options: [
            FormLabeledValue<FeePayerType>(
              label: "You",
              value: FeePayerType.fromString("receiver"),
            ),
            FormLabeledValue<FeePayerType>(
              label: "Your tenants",
              value: FeePayerType.fromString("payer"),
            ),
          ],
        );
}
