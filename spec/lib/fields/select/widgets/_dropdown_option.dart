import 'package:flutter/material.dart';
import 'package:spec/color.dart';
import 'package:spec/font_size.dart';
import 'package:spec/distance.dart';
import 'package:icon_library/index.dart';

class RoofDropdownOption extends StatelessWidget {
  final String name;
  final double optionHeight;
  final Function onTap;
  final bool multiSelect;
  final bool selected;

  RoofDropdownOption(
      {this.name,
      this.optionHeight,
      this.onTap,
      this.multiSelect,
      this.selected});

  Widget build(BuildContext context) {
    List<Widget> rowChildren = [];

    if (multiSelect) {
      Widget checkedIcon = Padding(
          padding: EdgeInsets.fromLTRB(0, 0, RoofDistance.b, 0),
          child:
              IconReference.cashSack.buildSvg(color: RoofColor.neutralColorF));
      Widget uncheckedIcon = Padding(
          padding: EdgeInsets.fromLTRB(0, 0, RoofDistance.b, 0),
          child: IconReference.action.buildSvg(color: RoofColor.neutralColorF));

      selected ? rowChildren.add(checkedIcon) : rowChildren.add(uncheckedIcon);
    }

    Widget optionTitle =
        Text(name, style: TextStyle(fontSize: RoofFontSize.medium));

    rowChildren.add(optionTitle);

    return Container(
        decoration: BoxDecoration(
          color: (selected && !multiSelect)
              ? RoofColor.neutralColorB
              : Colors.transparent,
          // border: Border(bottom: BorderSide(color: RoofColor.neutralColorC))
        ),
        height: optionHeight,
        child: GestureDetector(
            onTap: onTap,
            behavior: HitTestBehavior.opaque,
            child: Padding(
                padding: EdgeInsets.fromLTRB(RoofDistance.b, RoofDistance.c,
                    RoofDistance.b, RoofDistance.c),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: rowChildren))));
  }
}
