import 'package:form/index.dart';
import 'package:fee_payer_type/index.dart';
import 'package:form/src/data/option_picker_data.dart';

import 'option_picker.dart';

class FeePayerFormSelectFieldData extends FormOptionPickerFieldData {
  FeePayerFormSelectFieldData({
    String title,
    List<FormOptionPickerData<FeePayerType>> initialValue,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          size: size,
          isVisible: isVisible,
          options: [
            FormOptionPickerData<FeePayerType>(
              title: "You",
              data: FeePayerType.fromString("receiver"),
            ),
            FormOptionPickerData<FeePayerType>(
              title: "Your tenants",
              data: FeePayerType.fromString("payer"),
            ),
          ],
        );
}
