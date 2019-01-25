import 'package:flutter/material.dart';
import 'package:decorated_text/index.dart';
import 'package:icon_library/index.dart';

import 'package:spec/distance.dart';
import 'package:spec/font_weight.dart';
import 'package:spec/font_size.dart';
import 'package:spec/theme/index.dart';

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
                decoration: BoxDecoration(color: theme.backgroundColor.general),
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
                      iconReference.buildSvg(color: theme.iconColor.general)),

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

  const _DetailLabel({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final _style = TextStyle(
        color: theme.typeColor.secondary,
        fontSize: RoofFontSize.medium,
        fontWeight: RoofFontWeight.thin);

    return Text(text, style: _style);
  }
}

class _CellDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    return Container(
      height: 1,
      decoration: BoxDecoration(color: theme.strokeColor.light),
    );
  }
}

class _TitleLabel extends StatelessWidget {
  final WeightDecoratedText decoratedText;

  const _TitleLabel({Key key, @required this.decoratedText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final _defaultStyle = TextStyle(
        color: theme.typeColor.primary,
        fontSize: RoofFontSize.large,
        fontWeight: RoofFontWeight.thick);

    final _thinStyle = TextStyle(
        color: theme.typeColor.primary,
        fontSize: RoofFontSize.large,
        fontWeight: RoofFontWeight.thin);

    return decoratedText.generateWidget(
        defaultStyle: _defaultStyle,
        thinStyle: _thinStyle,
        textScaleFactor: MediaQuery.of(context).textScaleFactor);
  }
}
