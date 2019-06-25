import 'package:form/index.dart';
import 'package:frequency_type/index.dart';

import 'option_select.dart';

class FrequencyFormSelectFieldData extends FormOptionSelectFieldData {
  static List<FormOptionSelectValueData<FrequencyType>> _buildOptions() {
    final daily = FrequencyType.fromString("daily");
    final weekly = FrequencyType.fromString("weekly");
    final monthly = FrequencyType.fromString("monthly");

    return [
      FormOptionSelectValueData(
        title: daily.toString(),
        data: daily,
      ),
      FormOptionSelectValueData(
        title: weekly.toString(),
        data: weekly,
      ),
      FormOptionSelectValueData(
        title: monthly.toString(),
        data: monthly,
      ),
    ];
  }

  FrequencyFormSelectFieldData({
    String title,
    List<FormOptionSelectValueData<FrequencyType>> initialValue,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          size: size,
          isVisible: isVisible,
          options: _buildOptions(),
        );
}
