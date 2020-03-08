import 'package:decorated_text/index.dart';
import 'package:flutter/material.dart';
import 'package:mask/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:table_cell_builder/index.dart';
import 'package:tag_builder/index.dart';
import 'package:date/index.dart';

class TransferCell extends StatelessWidget
    with TagBuilder, StandardCellBuilder {
  final double amount;
  final String sender;
  final String receiver;
  final DateTime date;
  final String note;
  final void Function() onTap;
  // final PaymentStatus paymentStatus; ?

  TransferCell({
    @required this.amount,
    this.sender,
    this.receiver,
    this.date,
    this.note,
    this.onTap,
  });

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

    final participantsText = RichText(text: participantsTextSpan);

    final amountText = Text(
      formattedMoneyString,
      style: theme.typography.bodyHeavy.textStyle(
        color: amountColor,
      ),
    );

    final spacer = Container(width: theme.distance.spacing.horizontal.medium);

    final mainRow = Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Expanded(child: participantsText),
        spacer,
        amountText,
      ],
    );

    final dateRow = Row(
      children: [
        Text(
          Date.fromDateTime(date).toAgoString,
          style: theme.typography.detail.textStyle(
            color: theme.color.text.generalSecondary,
          ),
        )
      ],
    );

    final columnChildren = <Widget>[mainRow, dateRow];

    if (note != null) {
      columnChildren.add(
        Padding(
          padding: EdgeInsets.only(
            top: theme.distance.spacing.vertical.medium,
          ),
          child: Text(
            note,
            style: theme.typography.body.textStyle(
              color: theme.color.text.generalPrimary,
            ),
          ),
        ),
      );
    }

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
