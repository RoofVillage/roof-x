import 'package:form/index.dart';
import 'package:fee_payer_type/index.dart';
import '../options/titled_option_data.dart';

import 'option_picker.dart';

class FeePayerFormSelectFieldData extends FormOptionPickerFieldData {
  FeePayerFormSelectFieldData({
    String title,
    List<FormTitledOptionData<FeePayerType>> initialValue,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          size: size,
          isVisible: isVisible,
          options: [
            FormTitledOptionData<FeePayerType>(
              title: "You",
              data: FeePayerType.fromString("receiver"),
            ),
            FormTitledOptionData<FeePayerType>(
              title: "Your tenants",
              data: FeePayerType.fromString("payer"),
            ),
          ],
        );
}
