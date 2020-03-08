import 'package:flutter/material.dart';
import 'package:roof_table_cell_builder/src/_components/balance_cell.dart';

mixin BalanceCellBuilder {
  BalanceCell buildBalanceCell({
    @required double balance,
    void Function() onTap,
  }) =>
      BalanceCell(
        balance: balance,
        onTap: onTap,
      );
}
