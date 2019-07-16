import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:titled_value/index.dart';

import '_widgets/index.dart';
import '_picker_field.dart';

class OptionPickerField<T> extends StatelessWidget {
  final String title;
  final String emptyText;
  final List<TitledValue<T>> selectedOptions;
  final List<TitledValue<T>> options;
  final bool isMultiSelect;
  final Function onTap;
  final Function(List<TitledValue<T>>) onChanged;

  OptionPickerField({
    this.title,
    this.emptyText,
    this.selectedOptions,
    this.options,
    bool isMultiSelect,
    this.onTap,
    this.onChanged,
  }) : isMultiSelect = isMultiSelect ?? false;

  @override
  Widget build(BuildContext context) {
    List<TitledValue<T>> _selectedOptions;
    List<TitledValue<T>> _options;

    if (options != null && options.isNotEmpty) {
      _options = options;
    } else {
      _options = [
        TitledValue(title: emptyText),
      ];
    }

    if (selectedOptions == null && !isMultiSelect) {
      _selectedOptions = [_options[0]];
    } else {
      _selectedOptions = selectedOptions;
    }

    final List<Widget> columnChildren = [];

    if (title != null && title.isNotEmpty) {
      final label = RoofFieldLabel(labelText: title);
      columnChildren.add(label);
    }

    final selectedOptionsContainer = _SelectedOptionsContainer<T>(
      selectedOptions: _selectedOptions,
      emptyText: emptyText,
    );
    columnChildren.add(selectedOptionsContainer);

    return RoofPickerField(
      name: title,
      onTap: onTap,
      fieldBody: selectedOptionsContainer,
    );
  }
}

class _SelectedOptionsContainer<T> extends StatelessWidget {
  final List<TitledValue<T>> selectedOptions;
  final String emptyText;

  final _typographyStyle = typography.body;
  final _maxLines = 10;

  _SelectedOptionsContainer({
    this.selectedOptions,
    this.emptyText,
  });

  String _textForSelectedOptions() {
    if (selectedOptions?.isNotEmpty ?? false) {
      String text = "";

      for (var i = 0; i < selectedOptions.length; i++) {
        bool isLast = i == selectedOptions.length - 1;
        text += selectedOptions[i].title;
        if (!isLast) text += ", ";
      }
      return text;
    } else {
      return emptyText;
    }
  }

  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    return Text(
      _textForSelectedOptions(),
      style: _typographyStyle.textStyleWithColor(
        theme.color.text.primary,
      ),
      softWrap: true,
      maxLines: _maxLines,
      textAlign: TextAlign.end,
      overflow: TextOverflow.ellipsis,
    );
  }
}
