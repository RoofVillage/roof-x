import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:titled_icon/index.dart';

import '_widgets/index.dart';
import '_picker_field.dart';

class IconPickerField extends StatelessWidget {
  final String title;
  final TitledIcon selectedOption;
  final List<TitledIcon> options;
  final Function onTap;
  final Function(TitledIcon) onChanged;

  IconPickerField({
    this.title,
    this.selectedOption,
    this.options,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    TitledIcon _selectedOption = selectedOption ?? options[0];

    final theme = RoofTheme.of(context);

    final List<Widget> columnChildren = [];

    if (title != null && title.isNotEmpty) {
      final label = RoofFieldLabel(labelText: title);
      columnChildren.add(label);
    }

    final selectedIconWidget = _selectedOption.icon.buildWidget(
      color: theme.color.icon.general,
    );

    return RoofPickerField(
      name: title,
      fieldBody: selectedIconWidget,
      onTap: onTap,
    );
  }
}