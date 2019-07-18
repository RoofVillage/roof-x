import 'package:standard_icon_library/index.dart';
import 'package:labeled_value/index.dart';

class FormLabeledIcon extends LabeledValue<StandardIcon> {
  StandardIcon get icon => super.value;

  FormLabeledIcon({
    String title,
    StandardIcon icon,
  }) : super(
          label: title,
          value: icon,
        );
}
