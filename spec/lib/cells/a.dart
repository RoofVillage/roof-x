import 'package:flutter/material.dart';
import 'package:decorated_text/index.dart';
import 'package:icon_library/index.dart';

import 'package:spec/distance.dart';
import 'package:spec/theme/index.dart';
import 'package:spec/typography/index.dart';

class RoofCellA extends StatelessWidget {
  final WeightDecoratedText titleText;
  final String detailText;
  final SmallIconReference iconReference;
  final VoidCallback onTap;

  final _horizontalPadding = RoofDistance.b;
  final _minHeight = RoofDistance.f;

  RoofCellA(
      {Key key,
      @required this.titleText,
      @required this.iconReference,
      @required this.detailText,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    return ConstrainedBox(
        constraints: BoxConstraints(minHeight: _minHeight),
        child: GestureDetector(
            onTap: this.onTap,
            child: Container(
                decoration:
                    BoxDecoration(color: theme.color.background.general),
                // Everything in the cell is relative to the horizontal padding.
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: _horizontalPadding),

                    ///This column contains the body of the cell, and the divider;
                    child: Column(

                        ///Maximizes space between body and divider
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          _Body(
                              iconReference: iconReference,
                              titleText: titleText,
                              detailText: detailText),
                          _CellDivider()
                        ])))));
  }
}

class _Body extends StatelessWidget {
  final WeightDecoratedText titleText;
  final String detailText;
  final SmallIconReference iconReference;

  final _verticalPadding = RoofDistance.b;
  final _imagePaddingRight = RoofDistance.b;
  final _detailPaddingTop = RoofDistance.a;

  _Body(
      {Key key,
      @required this.titleText,
      @required this.iconReference,
      @required this.detailText})
      : super(key: key);

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
                  child:
                      iconReference.buildSvg(color: theme.color.icon.general)),

              ///This child should expand to occupy remaining space.
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _relevantLabels(),
              ))
            ]));
  }

  List<Widget> _relevantLabels() {
    List<Widget> list = [_TitleLabel(decoratedText: titleText)];
    if (detailText != null && detailText.trim().isNotEmpty) {
      list.add(Container(
          padding: EdgeInsets.only(top: _detailPaddingTop),
          child: _DetailLabel(text: detailText)));
    }
    return list;
  }
}

class _DetailLabel extends StatelessWidget {
  final String text;

  final _typographyStyle = RoofTypography.body2;

  _DetailLabel({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final secondaryTextColor = RoofTheme.of(context).color.text.secondary;

    return Text(text,
        style: _typographyStyle.textStyleWithColor(secondaryTextColor));
  }
}

class _CellDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    return Container(
      height: 1,
      decoration: BoxDecoration(color: theme.color.stroke.light),
    );
  }
}

class _TitleLabel extends StatelessWidget {
  final WeightDecoratedText decoratedText;

  final _defaultTypographyStyle = RoofTypography.body1a;
  final _thinTypographyStyle = RoofTypography.body1b;

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
