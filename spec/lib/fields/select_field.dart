import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';

import 'package:spec/object_padding.dart';
import 'package:spec/device_haptic.dart';
import 'package:spec/font_size.dart';
import 'package:spec/color.dart';
import 'package:spec/distance.dart';
import 'package:spec/corner_radius.dart';

import 'package:spec/fields/widgets/_field_label.dart';

class RoofSelectFieldCustom extends StatefulWidget {
  final String title;
  final String emptyText;
  final List<Map> model;
  final List<Map> options;
  final bool multiSelect;

  const RoofSelectFieldCustom(
      {this.title, this.emptyText, this.model, this.options, this.multiSelect});

  @override
  _RoofSelectFieldCustomState createState() => _RoofSelectFieldCustomState(
      title: title, model: model, options: options, multiSelect: multiSelect);
}

class _RoofSelectFieldCustomState extends State<RoofSelectFieldCustom>
    with SingleTickerProviderStateMixin {
  String title;
  String emptyText;
  List<Map> model;
  List<Map> options;
  bool multiSelect;
  bool isExpanded;

  _RoofSelectFieldCustomState(
      {this.title,
      this.emptyText = "No selection",
      this.model,
      this.options,
      this.multiSelect = false});

  @override
  void initState() {
    // multiSelect ??= false;
    model ??= [];
    if (model.length == 0 && !multiSelect) model.add(options[0]);
    isExpanded = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _updateDropdown() {
      isExpanded ? VibrateDevice.mediumImpact() : VibrateDevice.lightImpact();
      setState(() {
        isExpanded = !isExpanded;
      });
    }

    _addOption(Map option) {
      setState(() {
        model.add(option);
      });
    }

    _removeOption(Map option) {
      setState(() {
        model.remove(option);
      });
    }

    _setOption(Map option) {
      setState(() {
        model[0] = option;
      });
    }

    _updateModelWithOption(Map option) {
      if (multiSelect) {
        VibrateDevice.lightImpact();
        model.contains(option) ? _removeOption(option) : _addOption(option);
      } else {
        _setOption(option);
        _updateDropdown();
      }
    }

    Widget label = RoofFieldLabel(labelText: title);

    String modelText = "";
    for (var i = 0; i < model.length; i++) {
      bool isLast = (i == model.length - 1);
      modelText += model[i]["name"];
      if (!isLast) modelText += ", ";
    }

    Widget modelContainer = _RoofModelContainer(
        modelText: modelText,
        emptyText: emptyText,
        onTap: _updateDropdown,
        isExpanded: isExpanded);

    Widget dropdownContainer = _RoofDropdownContainer(
        options: options,
        model: model,
        multiSelect: multiSelect,
        isExpanded: isExpanded,
        onTap: _updateModelWithOption);

    return Container(
        margin: RoofObjectPadding.fieldPaddingA(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [label, modelContainer, dropdownContainer]));
  }
}

class _RoofModelContainer extends StatelessWidget {
  final String modelText;
  final String emptyText;
  final Function onTap;
  final bool isExpanded;

  _RoofModelContainer(
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

class _RoofDropdownContainer extends StatelessWidget {
  final List<Map> options;
  final List<Map> model;
  final bool multiSelect;
  final bool isExpanded;
  final Function onTap;

  _RoofDropdownContainer(
      {this.options,
      this.model,
      this.multiSelect,
      this.isExpanded,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    double optionHeight = 60;

    return Container(
        decoration: _dropdownContainerStyle(),
        child: AnimatedCrossFade(
            firstChild: _RoofDropdownContents(
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

  BoxDecoration _dropdownContainerStyle() {
    return BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: RoofCornerRadius.small,
            bottomRight: RoofCornerRadius.small),
        color: RoofColor.neutralColorA,
        boxShadow: [
          BoxShadow(
            color: RoofColor.neutralColorE,
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ]);
  }
}

class _RoofDropdownContents extends StatelessWidget {
  final List<Map> options;
  final List<Map> model;
  final bool multiSelect;
  final double optionHeight;
  final Function onTap;

  _RoofDropdownContents(
      {this.options,
      this.model,
      this.multiSelect,
      this.optionHeight,
      this.onTap});

  Widget build(BuildContext context) {
    List<Widget> optionsList = [];
    for (var option in options) {
      optionsList.add(_RoofDropdownOption(
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

class _RoofDropdownOption extends StatelessWidget {
  final String name;
  final double optionHeight;
  final Function onTap;
  final bool multiSelect;
  final bool selected;

  _RoofDropdownOption(
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
