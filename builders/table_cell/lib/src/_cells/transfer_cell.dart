import 'package:flutter/material.dart';
import 'package:mask/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:table_cell_builder/index.dart';
import 'package:tag_builder/index.dart';
import 'package:date/index.dart';
import 'package:dwolla_types/index.dart';

class TransferCell extends StatelessWidget
    with TagBuilder, StandardCellBuilder {
  final double amount;
  final String domain;
  final String sender;
  final String receiver;
  final DateTime date;
  final String note;
  final void Function() onTap;
  final TransferStatus transferStatus;

  TransferCell(
      {@required this.amount,
      this.domain,
      this.sender,
      this.receiver,
      this.date,
      this.note,
      this.onTap,
      this.transferStatus});

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final textStyle = theme.typography.body.textStyle(
      color: theme.color.text.generalSecondary,
    );
    final heavyTextStyle = theme.typography.bodyHeavy.textStyle(
      color: theme.color.text.generalSecondary,
    );

    Color amountColor;
    TextSpan participantsTextSpan;

    final moneyString = applyMask(
      MaskOption.money,
      text: amount.toString(),
      context: context,
    );

    String formattedMoneyString;

    switch ("${sender != null} ${receiver != null}") {
      case 'true true':
        amountColor = theme.color.text.generalPrimary;
        formattedMoneyString = moneyString;
        participantsTextSpan = TextSpan(
          children: [
            TextSpan(text: sender, style: heavyTextStyle),
            TextSpan(text: ' paid '),
            TextSpan(text: receiver, style: heavyTextStyle),
          ],
          style: textStyle,
        );
        break;
      case 'true false':
        amountColor = theme.color.text.good;
        formattedMoneyString = moneyString;
        participantsTextSpan = TextSpan(
          children: [
            TextSpan(text: sender, style: heavyTextStyle),
            TextSpan(text: ' paid you'),
          ],
          style: textStyle,
        );
        break;
      case 'false true':
        amountColor = theme.color.text.bad;
        formattedMoneyString = "-$moneyString";
        participantsTextSpan = TextSpan(
          children: [
            TextSpan(text: 'You paid '),
            TextSpan(text: receiver, style: heavyTextStyle),
          ],
          style: textStyle,
        );
        break;
    }

    final dateRow = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          Date.fromDateTime(date).toAgoString,
          style: theme.typography.detail.textStyle(
            color: theme.color.text.generalSecondary,
          ),
        )
      ],
    );

    if (transferStatus == TransferStatus.failed)
      amountColor = theme.color.text.generalSecondary;

    final participantsText = Padding(
      padding: EdgeInsets.only(
        right: theme.distance.spacing.horizontal.medium,
      ),
      child: RichText(text: participantsTextSpan),
    );

    final amountText = Text(
      formattedMoneyString,
      style: theme.typography.bodyHeavy.textStyle(
        color: amountColor,
      ),
    );

    final mainRow = Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Expanded(child: participantsText),
        amountText,
      ],
    );

    final List<Widget> secondRowChildren = [];

    if (domain != null && domain.isNotEmpty) {
      final domainText = Text(
        domain,
        style: theme.typography.detailHeavy.textStyle(
          color: theme.color.text.generalSecondary,
        ),
      );
      secondRowChildren.add(domainText);
    }

    secondRowChildren.add(
      Expanded(child: Container()),
    );

    Widget paymentStatusText;
    if (transferStatus != null) {
      switch (transferStatus) {
        case TransferStatus.processed:
          break;
        case TransferStatus.pending:
          paymentStatusText = Text(
            'pending',
            style: theme.typography.detailHeavy.textStyle(
              color: theme.color.text.generalSecondary,
            ),
          );
          break;
        case TransferStatus.manual:
          paymentStatusText = Text(
            'manual',
            style: theme.typography.detailHeavy.textStyle(
              color: theme.color.text.generalSecondary,
            ),
          );
          break;
        case TransferStatus.cancelled:
          paymentStatusText = Text(
            'cancelled',
            style: theme.typography.detailHeavy.textStyle(
              color: theme.color.text.generalSecondary,
            ),
          );
          break;
        case TransferStatus.failed:
          paymentStatusText = Text(
            'failed',
            style: theme.typography.detailHeavy.textStyle(
              color: theme.color.text.bad,
            ),
          );
          break;
      }
    }
    if (paymentStatusText != null) {
      secondRowChildren.add(paymentStatusText);
    }

    final secondRow = Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: secondRowChildren,
    );

    final rowSpacer = Container(height: theme.distance.spacing.vertical.min);
    final columnChildren = <Widget>[
      mainRow,
      rowSpacer,
      secondRow,
    ];

    if (note != null && note.isNotEmpty) {
      final noteRow = Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: theme.distance.padding.vertical.small,
              ),
              child: Text(
                note,
                style: theme.typography.body.textStyle(
                  color: theme.color.text.generalPrimary,
                ),
              ),
            ),
          ),
        ],
      );
      columnChildren.addAll([
        rowSpacer,
        noteRow,
      ]);
    }

    columnChildren.addAll([
      rowSpacer,
      dateRow,
    ]);

    final column = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: columnChildren,
    );

    return buildStandardCell(
      child: column,
      onTap: onTap,
    );
  }
}
