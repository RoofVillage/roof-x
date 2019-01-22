import 'package:flutter/material.dart';
import 'widgets/_dropdown_container.dart';
import 'widgets/_model_container.dart';
import 'package:spec/object_padding.dart';
import 'package:spec/device_haptics.dart';
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

    Widget modelContainer = RoofModelContainer(
        modelText: modelText,
        emptyText: emptyText,
        onTap: _updateDropdown,
        isExpanded: isExpanded);

    Widget dropdownContainer = RoofDropdownContainer(
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
