import 'package:flutter/material.dart';
import 'package:roof_table_cell_builder/src/_components/property_cell.dart';
import 'package:views/index.dart';

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
