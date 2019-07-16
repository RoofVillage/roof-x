import 'package:standard_icon_library/index.dart';
import 'package:titled_value/index.dart';

class FormTitledIcon extends TitledValue<StandardIcon> {
  StandardIcon get icon => super.value;

  FormTitledIcon({
    String title,
    StandardIcon icon,
  }) : super(
          title: title,
          value: icon,
        );
}
