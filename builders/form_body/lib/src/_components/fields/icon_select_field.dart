import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:icon_picker_data/index.dart';

import '_widgets/index.dart';
import '_picker_field.dart';

class IconSelectField extends StatefulWidget {
  final String title;
  final IconPickerData selectedOption;
  final List<IconPickerData> options;
  final Function onTap;
  final Function(IconPickerData) onChanged;

  const IconSelectField({
    this.title,
    this.selectedOption,
    this.options,
    this.onTap,
    this.onChanged,
  });

  @override
  _IconSelectFieldState createState() => _IconSelectFieldState();
}

class _IconSelectFieldState extends State<IconSelectField>
    with SingleTickerProviderStateMixin {
  IconPickerData selectedOption;
  List<IconPickerData> options;
  bool isExpanded = false;

  @override
  void initState() {
    selectedOption = widget.selectedOption ?? widget.options[0];
    options = widget.options;
    isExpanded = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final List<Widget> columnChildren = [];

    if (widget.title != null && widget.title.isNotEmpty) {
      final label = RoofFieldLabel(labelText: widget.title);
      columnChildren.add(label);
    }

    final selectedIconWidget =
        selectedOption.icon.buildWidget(color: theme.color.icon.general);

    return RoofPickerField(
      name: widget.title,
      fieldBody: selectedIconWidget,
      onTap: widget.onTap,
    );
  }
}
