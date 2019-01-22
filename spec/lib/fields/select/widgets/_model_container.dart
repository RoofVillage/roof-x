import 'package:flutter/material.dart';
import 'package:spec/distance.dart';
import 'package:spec/font_size.dart';
import 'package:spec/color.dart';
import 'package:icon_library/index.dart';

class RoofModelContainer extends StatelessWidget {
  final String modelText;
  final String emptyText;
  final Function onTap;
  final bool isExpanded;

  RoofModelContainer(
      {this.modelText, this.emptyText, this.onTap, this.isExpanded});

  Widget build(BuildContext context) {
    Widget modelChild;
    if (modelText == "")
      modelChild = Text(emptyText,
          style: TextStyle(
              fontSize: RoofFontSize.medium, color: RoofColor.neutralColorE));
    else
      modelChild = Expanded(
          flex: 1,
          child: Text(
            modelText,
            style: TextStyle(fontSize: RoofFontSize.medium),
            softWrap: true,
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
          ));

    Widget upArrow =
        IconReference.cashSack.buildSvg(color: RoofColor.neutralColorF);
    Widget downArrow =
        IconReference.action.buildSvg(color: RoofColor.neutralColorF);
    Widget animatedArrow = Expanded(
      flex: 0,
      child: Padding(
        padding: EdgeInsets.fromLTRB(RoofDistance.d, 0, 0, 0),
        child: AnimatedIconReference(
            icon1: upArrow, icon2: downArrow, showIcon1: isExpanded),
      ),
    );

    return Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: RoofColor.neutralColorD))),
        child: GestureDetector(
            onTap: onTap,
            behavior: HitTestBehavior.opaque,
            child: Padding(
                padding:
                    EdgeInsets.fromLTRB(0, RoofDistance.b, 0, RoofDistance.b),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [modelChild, animatedArrow]))));
  }
}
