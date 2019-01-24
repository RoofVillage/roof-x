import 'package:flutter/material.dart';
import 'package:spec/color.dart';
import 'package:spec/corner_radius.dart';
import 'package:spec/object_padding.dart';
import 'package:spec/font_size.dart';
import 'package:spec/distance.dart';
import 'package:spec/font_weight.dart';

class RoofButtonB extends StatelessWidget {
  final String text;
  final Function onTap;

  final _decoration = BoxDecoration(
      border: Border.all(color: RoofColor.highlight, width: 2.0),
      borderRadius: BorderRadius.all(RoofCornerRadius.regular));

  final _style = TextStyle(
      color: RoofColor.highlight,
      fontSize: RoofFontSize.large,
      fontWeight: RoofFontWeight.extraThick);

  final _padding = EdgeInsets.all(RoofDistance.c);
  RoofButtonB({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return _RoofButton(
        decoration: _decoration,
        style: _style,
        padding: _padding,
        onTap: onTap,
        text: text);
  }
}

// class RoofButtonA extends StatelessWidget {
//   final String text;
//   final Function onTap;

//   final _decoration = BoxDecoration(
//       border: Border.all(color: RoofColor.highlight, width: 2.0),
//       borderRadius: BorderRadius.all(RoofCornerRadius.regular));

//   final _style = TextStyle(
//       color: RoofColor.highlight,
//       fontSize: RoofFontSize.large,
//       fontWeight: RoofFontWeight.extraThick);

//   final _padding = EdgeInsets.all(RoofDistance.c);

//   RoofButtonA({this.text, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return RoofButton(
//         decoration: _decoration,
//         style: _style,
//         padding: _padding,
//         onTap: onTap,
//         text: text);
//   }
// }

class _RoofButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final BoxDecoration decoration;
  final TextStyle style;
  final EdgeInsets padding;

  const _RoofButton(
      {this.text, this.onTap, this.decoration, this.style, this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            margin: RoofObjectPadding.fieldPaddingB(),
            padding: padding,
            decoration: decoration,
            child: Text(text, style: style, textAlign: TextAlign.center)));
  }
}
