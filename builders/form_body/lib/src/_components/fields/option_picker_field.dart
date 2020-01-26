import 'package:flutter/material.dart';
import 'package:labeled_value/index.dart';
import 'package:semantic_theme/index.dart';

import '_widgets/index.dart';
import '_picker_field.dart';

class OptionPickerField<T> extends StatelessWidget {
  final String title;
  final String emptyText;
  final List<LabeledValue<T>> selectedOptions;
  final List<LabeledValue<T>> options;
  final bool isMultiSelect;
  final Function onTap;
  final Function(List<LabeledValue<T>>) onChanged;

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
    List<LabeledValue<T>> _selectedOptions;
    List<LabeledValue<T>> _options;

    if (options != null && options.isNotEmpty) {
      _options = options;
    } else {
      _options = [
        LabeledValue(label: emptyText),
      ];
    }

    if (selectedOptions == null && !isMultiSelect) {
      _selectedOptions = [_options[0]];
    } else {
      _selectedOptions = selectedOptions;
    }

    final List<Widget> columnChildren = [];

    if (title != null && title.isNotEmpty) {
      final label = FieldLabel(labelText: title);
      columnChildren.add(label);
    }

    final selectedOptionsContainer = _SelectedOptionsContainer<T>(
      selectedOptions: _selectedOptions,
      emptyText: emptyText,
    );
    columnChildren.add(selectedOptionsContainer);

    return PickerField(
      name: title,
      onTap: onTap,
      fieldBody: selectedOptionsContainer,
    );
  }
}

class _SelectedOptionsContainer<T> extends StatelessWidget {
  final List<LabeledValue<T>> selectedOptions;
  final String emptyText;

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
        text += selectedOptions[i].label;
        if (!isLast) text += ", ";
      }
      return text;
    } else {
      return emptyText;
    }
  }

  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    return Text(
      _textForSelectedOptions(),
      style: theme.typography.body.textStyle(
        color: theme.color.text.generalPrimary,
      ),
      softWrap: true,
      maxLines: _maxLines,
      textAlign: TextAlign.end,
      overflow: TextOverflow.ellipsis,
    );
  }
}
