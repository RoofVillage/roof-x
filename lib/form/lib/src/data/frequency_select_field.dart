import 'package:form/index.dart';
import 'package:frequency_type/index.dart';

import 'option_select.dart';

class FrequencyFormSelectFieldData extends FormOptionSelectFieldData {
  static List<FormOptionSelectValueData<FrequencyType>> _buildOptions() {
    final daily = FrequencyType.fromString("daily");
    final weekly = FrequencyType.fromString("weekly");
    final monthly = FrequencyType.fromString("monthly");

    return [
      FormOptionSelectValueData<FrequencyType>(
        title: daily.inlineString,
        data: daily,
      ),
      FormOptionSelectValueData<FrequencyType>(
        title: weekly.inlineString,
        data: weekly,
      ),
      FormOptionSelectValueData<FrequencyType>(
        title: monthly.inlineString,
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
