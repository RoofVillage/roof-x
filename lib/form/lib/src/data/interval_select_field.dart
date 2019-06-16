import 'package:form/index.dart';
import 'package:interval/index.dart';

import 'option_select.dart';

class IntervalFormSelectFieldData extends FormOptionSelectData {
  static List<FormOptionSelectValueData<int>> _buildOptions(int count) {
    final List<FormOptionSelectValueData> options = [];

    for (int i = 0; i < count; i++) {
      final optionTitle = IntervalString.fromInt(i);
      options.add(
        FormOptionSelectValueData(title: optionTitle, data: i),
      );
    }

    return options;
  }

  IntervalFormSelectFieldData({
    String title,
    List<FormOptionSelectValueData<int>> initialValue,
    int optionsCount = 3,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          size: size,
          isVisible: isVisible,
          options: _buildOptions(optionsCount),
        );
}
