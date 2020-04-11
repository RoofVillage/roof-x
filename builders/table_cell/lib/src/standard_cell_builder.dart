import 'package:flutter/material.dart';

import './_components/standard_cell.dart';

mixin StandardCellBuilder {
  StandardCell buildStandardCell({
    @required Widget child,
    void Function() onTap,
  }) =>
      StandardCell(
        child: child,
        onTap: onTap,
      );
}
