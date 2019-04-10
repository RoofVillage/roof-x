import 'package:flutter/material.dart';
import 'package:typography/index.dart' as typography;
import 'package:theme/index.dart';

class RoofTableSectionHeaderA extends StatelessWidget {
  final String title;

  RoofTableSectionHeaderA({@required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    return Container(
        color: theme.color.background.general,
        child: Center(child: _TitleLabel(text: title)));
  }
}

class _TitleLabel extends StatelessWidget {
  final String text;
  final _typographyStyle = typography.heading2;

  _TitleLabel({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brandColor = RoofTheme.of(context).color.text.brand;
    return Text(text, style: _typographyStyle.textStyleWithColor(brandColor));
  }
}
