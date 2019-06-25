import 'package:form/index.dart';
import 'package:fee_payer_type/index.dart';
import 'package:form/src/data/option_select_value.dart';

import 'option_select.dart';

class FeePayerFormSelectFieldData extends FormOptionSelectFieldData {
  FeePayerFormSelectFieldData({
    String title,
    List<FormOptionSelectValueData<FeePayerType>> initialValue,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          size: size,
          isVisible: isVisible,
          options: [
            FormOptionSelectValueData<FeePayerType>(
              title: "You",
              data: FeePayerType.fromString("receiver"),
            ),
            FormOptionSelectValueData<FeePayerType>(
              title: "Your tenants",
              data: FeePayerType.fromString("payer"),
            ),
          ],
        );
}
