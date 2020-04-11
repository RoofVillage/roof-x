import 'package:flutter/material.dart';
import 'package:property/index.dart';

import '_cells/property_cell.dart';

mixin PropertyCellBuilder {
  PropertyCell buildPropertyCell({
    @required Property property,
    void Function() onTap,
  }) =>
      PropertyCell(
        property: property,
        onTap: onTap,
      );
}
