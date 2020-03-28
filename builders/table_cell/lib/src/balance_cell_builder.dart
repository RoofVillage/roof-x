import 'package:flutter/material.dart';

import '_cells/balance_cell.dart';

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
