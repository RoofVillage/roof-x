import 'package:flutter/material.dart';
import 'package:mask/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:table_cell_builder/index.dart';
import 'package:tag_builder/index.dart';

class BalanceCell extends StatelessWidget with CardCellBuilder, TagBuilder {
  final double balance;
  final void Function() onTap;

  BalanceCell({
    @required this.balance,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final balanceText = Text(
      applyMask(
        MaskOption.money,
        text: balance.toString(),
        context: context,
      ),
      style: theme.typography.title.textStyle(
        color: theme.color.text.generalPrimary,
      ),
    );

    final subtitleText = Text(
      'Balance',
      style: theme.typography.subtitle.textStyle(
        color: theme.color.text.generalSecondary,
      ),
    );

    final column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        balanceText,
        Padding(
          padding: EdgeInsets.only(
            top: theme.distance.spacing.vertical.small,
          ),
          child: subtitleText,
        ),
      ],
    );

    return buildCardCell(
      child: column,
      onTap: onTap,
    );
  }
}
