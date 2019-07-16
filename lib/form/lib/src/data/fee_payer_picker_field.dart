import 'package:form/index.dart';
import 'package:fee_payer_type/index.dart';
import '../options/titled_value.dart';

import 'option_picker_field.dart';

class FormFeePayerPickerFieldData extends FormOptionPickerFieldData {
  FormFeePayerPickerFieldData({
    String title,
    List<FormTitledValue<FeePayerType>> initialValue,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          size: size,
          isVisible: isVisible,
          options: [
            FormTitledValue<FeePayerType>(
              title: "You",
              value: FeePayerType.fromString("receiver"),
            ),
            FormTitledValue<FeePayerType>(
              title: "Your tenants",
              value: FeePayerType.fromString("payer"),
            ),
          ],
        );
}
