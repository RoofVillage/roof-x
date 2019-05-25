import 'package:flutter/material.dart';
import 'package:decorated_text/index.dart';
import 'package:icon_library/index.dart';
import 'package:date/index.dart';
import 'package:distance/index.dart' as distance;
import 'package:theme/index.dart';
import 'package:typography/index.dart' as typography;

class RoofActivityCell extends StatelessWidget {
  final WeightDecoratedText title;
  final int timestamp;
  final StandardIconReference iconReference;
  final String note;
  final VoidCallback onTap;

  final double _horizontalPadding = distance.b;
  final double _verticalPadding = distance.a;

  RoofActivityCell({
    @required this.title,
    @required this.timestamp,
    @required this.iconReference,
    this.note,
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: this.onTap,
        child: Container(
          // Everything in the cell is relative to the horizontal padding.
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: _horizontalPadding,
              vertical: _verticalPadding,
            ),

            ///This column contains the body of the cell, and the divider;
            child: Column(
              ///Maximizes space between body and divider
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _Body(
                  iconReference: iconReference,
                  title: title,
                  note: note,
                ),
                _TimeLabel(timestamp),
                _CellDivider()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final WeightDecoratedText title;
  final StandardIconReference iconReference;
  final String note;

  final _verticalPadding = distance.b;
  final _imagePaddingRight = distance.b;
  final _detailPaddingTop = distance.a;

  _Body({
    @required this.title,
    @required this.iconReference,
    this.note,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: _verticalPadding),
      //The body of the cell contains the icon and the labels.
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: _imagePaddingRight),
            child: iconReference.buildSvg(color: theme.color.icon.general),
          ),

          ///This child should expand to occupy remaining space.
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _relevantLabels(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _relevantLabels() {
    var list = <Widget>[_TitleLabel(decoratedText: title)];
    if (note != null && note.trim().isNotEmpty) {
      list.add(
        Container(
          padding: EdgeInsets.only(top: _detailPaddingTop),
          child: _DetailLabel(text: note),
        ),
      );
    }
    return list;
  }
}

class _DetailLabel extends StatelessWidget {
  final String text;

  final _typographyStyle = typography.bodySecondary;

  _DetailLabel({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final secondaryTextColor = RoofTheme.of(context).color.text.secondary;

    return Text(
      text,
      style: _typographyStyle.textStyleWithColor(secondaryTextColor),
    );
  }
}

class _CellDivider extends StatelessWidget {

  final _topMargin = distance.b;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final dividerColor = theme.color.stroke.light;

    return Container(
      margin: EdgeInsets.only(top: _topMargin),
      height: 1,
      decoration: BoxDecoration(color: dividerColor),
    );
  }
}

class _TitleLabel extends StatelessWidget {
  final WeightDecoratedText decoratedText;

  final _defaultTypographyStyle = typography.bodyPrimaryThick;
  final _thinTypographyStyle = typography.bodyPrimary;

  _TitleLabel({Key key, @required this.decoratedText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryTextColor = RoofTheme.of(context).color.text.primary;

    return decoratedText.generateWidget(
        defaultStyle:
            _defaultTypographyStyle.textStyleWithColor(primaryTextColor),
        thinStyle: _thinTypographyStyle.textStyleWithColor(primaryTextColor),
        textScaleFactor: MediaQuery.of(context).textScaleFactor);
  }
}

class _TimeLabel extends StatelessWidget {
  final int timestamp;

  _TimeLabel(this.timestamp);

  final _typographyStyle = typography.detailSecondary;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final formattedTimestamp =
        Date.fromSecondsSinceEpoch(timestamp).toAdaptiveString;

    final textWidget = Text(
      formattedTimestamp,
      style: _typographyStyle.textStyleWithColor(
        theme.color.text.secondary,
      ),
    );

    return Container(
      alignment: Alignment(1, 0),
      child: textWidget,
    );
  }
}
