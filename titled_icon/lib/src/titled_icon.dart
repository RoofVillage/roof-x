import 'package:standard_icon_library/index.dart';
import 'package:titled_value/index.dart';

class TitledIcon extends TitledValue<StandardIcon> {
  StandardIcon get icon => super.value;

  TitledIcon({
    String title,
    StandardIcon icon,
  }) : super(
          title: title,
          value: icon,
        );
}
