import 'package:flutter/material.dart';
import 'package:x_small_icon_library/index.dart';
import '_components/alert_cell.dart';
import 'types/alert_type.dart';

mixin AlertCellBuilder {
  AlertCell buildAlertCell({
    @required String text,
    XSmallIcon icon,
    AlertType type,
    void Function() onTap,
  }) =>
      AlertCell(
        text: text,
        icon: icon,
        type: type,
        onTap: onTap,
      );
}
