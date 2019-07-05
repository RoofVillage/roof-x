import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:small_icon_library/index.dart';
import 'package:distance/index.dart' as distance;
import 'package:typography/index.dart' as typography;
import 'package:option_picker_data/index.dart';

typedef SelectedOptionsPasser<T> = Function(List<OptionPickerData<T>>);

class OptionPicker<T> extends StatelessWidget {
  final String title;
  final String emptyText;
  final List<OptionPickerData<T>> initialSelected;
  final List<OptionPickerData<T>> options;
  final bool isMultiSelect;
  final SelectedOptionsPasser<T> onChanged;

  OptionPicker({
    this.title,
    this.emptyText,
    this.initialSelected,
    @required this.options,
    bool isMultiSelect,
    this.onChanged,
  }) : isMultiSelect = isMultiSelect ?? false;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final List<Widget> columnChildren = [];

    if (title != null && title.isNotEmpty) {
      final titleWidget = Text(
        title,
        style: typography.heading2.textStyleWithColor(theme.color.text.brand),
      );
      columnChildren.add(titleWidget);
    }

    final optionsColumn = _OptionsColumn(
      options: options,
      selectedOptions: initialSelected,
      isMultiSelect: isMultiSelect,
      onOptionTap: _onOptionTap,
      emptyText: emptyText,
    );
    columnChildren.add(optionsColumn);

    return Container(
      child: Column(
        children: columnChildren,
      ),
    );
  }

  _onOptionTap(OptionPickerData<T> option) {
    List<OptionPickerData<T>> selectedOptions;

    if (isMultiSelect) {
      selectedOptions.contains(option)
          ? selectedOptions.remove(option)
          : selectedOptions.add(option);
    } else {
      selectedOptions = [option];
    }

    onChanged(selectedOptions);
  }
}

class _OptionsColumn<T> extends StatelessWidget {
  final List<OptionPickerData<T>> options;
  final List<OptionPickerData<T>> selectedOptions;
  final bool isMultiSelect;
  final Function onOptionTap;
  final String emptyText;

  _OptionsColumn({
    this.options,
    this.selectedOptions,
    bool isMultiSelect,
    this.onOptionTap,
    this.emptyText,
  }) : isMultiSelect = isMultiSelect ?? false;

  final _verticalSpacing = distance.c;

  Widget build(BuildContext context) {
    List<OptionPickerData<T>> _selectedOptions = selectedOptions ?? [];
    List<Widget> optionsList = [];

    if (options != null && options.isNotEmpty) {
      if (_selectedOptions.isEmpty) {
        _selectedOptions.add(options[0]);
      }

      for (OptionPickerData<T> option in options) {
        final dropdownOption = _Option<T>(
          name: option.title,
          data: option.data,
          selected: _selectedOptions.contains(option),
          canToggle: isMultiSelect,
          onTap: () => onOptionTap(option),
        );
        optionsList.add(
          dropdownOption,
        );
      }
    } else {
      optionsList.add(
        _Option<T>(
          name: emptyText ?? "No options",
          selected: true,
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: _verticalSpacing),
      child: Column(
        children: optionsList,
      ),
    );
  }
}

class _Option<T> extends StatelessWidget {
  final String name;
  final T data;
  final Function onTap;
  final bool canToggle;
  final bool selected;

  final _typographyStyle = typography.bodyPrimary;
  final _checkIcon = SmallIcon.boxChecked;
  final _uncheckedIcon = SmallIcon.boxUnchecked;
  final _iconPadding = distance.c;

  _Option({
    this.name,
    this.data,
    this.onTap,
    bool canToggle,
    this.selected,
  }) : canToggle = canToggle ?? false;

  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    List<Widget> rowChildren = [];

    if (canToggle) {
      final generalIconColor = theme.color.icon.general;
      Widget checkedIcon = Padding(
        padding: EdgeInsets.only(right: _iconPadding),
        child: _checkIcon.buildWidget(color: generalIconColor),
      );
      Widget uncheckedIcon = Padding(
        padding: EdgeInsets.only(right: _iconPadding),
        child: _uncheckedIcon.buildWidget(color: generalIconColor),
      );

      selected ? rowChildren.add(checkedIcon) : rowChildren.add(uncheckedIcon);
    }

    final optionTitle = Text(
      name,
      style: (selected || canToggle)
          ? _typographyStyle.textStyleWithColor(theme.color.text.primary)
          : _typographyStyle.textStyleWithColor(theme.color.text.secondary),
    );

    final optionPadding = EdgeInsets.symmetric(
      horizontal: distance.b,
      vertical: distance.d,
    );

    rowChildren.add(optionTitle);

    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: theme.color.stroke.light)),
      ),
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: optionPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: rowChildren,
          ),
        ),
      ),
    );
  }
}
