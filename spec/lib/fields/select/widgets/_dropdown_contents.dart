import 'package:flutter/material.dart';
import '_dropdown_option.dart';

class RoofDropdownContents extends StatelessWidget {
  final List<Map> options;
  final List<Map> model;
  final bool multiSelect;
  final double optionHeight;
  final Function onTap;

  RoofDropdownContents(
      {this.options,
      this.model,
      this.multiSelect,
      this.optionHeight,
      this.onTap});

  Widget build(BuildContext context) {
    List<Widget> optionsList = [];
    for (var option in options) {
      optionsList.add(RoofDropdownOption(
          name: option["name"],
          selected: model.contains(option),
          multiSelect: multiSelect,
          optionHeight: optionHeight,
          onTap: () => onTap(option)));
    }

    double optionsVisible = 4.5;
    double totalDropdownHeight = optionHeight * optionsList.length.toDouble();
    if (totalDropdownHeight > optionsVisible * optionHeight)
      totalDropdownHeight = optionsVisible * optionHeight;

    return Container(
        height: totalDropdownHeight, child: ListView(children: optionsList));
  }
}
