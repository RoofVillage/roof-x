import 'package:flutter/material.dart';
import '_components/card_cell.dart';

mixin CardCellBuilder {
  CardCell buildCardCell({
    @required Widget child,
    void Function() onTap,
  }) =>
      CardCell(
        child: child,
        onTap: onTap,
      );
}
