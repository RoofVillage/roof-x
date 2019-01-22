import 'package:flutter/material.dart';
import 'package:spec/field_styles.dart';
import '_dropdown_contents.dart';

class RoofDropdownContainer extends StatelessWidget {
  final List<Map> options;
  final List<Map> model;
  final bool multiSelect;
  final bool isExpanded;
  final Function onTap;

  RoofDropdownContainer(
      {this.options,
      this.model,
      this.multiSelect,
      this.isExpanded,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    double optionHeight = 60;

    return Container(
        decoration: RoofFieldStyle.dropdownContainerStyle(),
        child: AnimatedCrossFade(
            firstChild: RoofDropdownContents(
                options: options,
                model: model,
                multiSelect: multiSelect,
                optionHeight: optionHeight,
                onTap: onTap),
            secondChild: Container(),
            firstCurve: Curves.easeIn,
            secondCurve: Curves.easeIn,
            sizeCurve: Curves.decelerate,
            crossFadeState: isExpanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: isExpanded
                ? Duration(milliseconds: 150)
                : Duration(milliseconds: 120)));
  }
}
