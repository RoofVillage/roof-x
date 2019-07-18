import 'package:standard_icon_library/index.dart';
import 'package:labeled_value/index.dart';

class LabeledIcon extends LabeledValue<StandardIcon> {
  StandardIcon get icon => super.value;

  LabeledIcon({
    String label,
    StandardIcon icon,
  }) : super(
          label: label,
          value: icon,
        );
}
