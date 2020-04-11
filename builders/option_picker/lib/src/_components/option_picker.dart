import 'package:flutter/material.dart';
import 'package:small_icon_library/index.dart';
import 'package:labeled_value/index.dart';
import 'package:semantic_theme/index.dart';

typedef SelectedOptionsPasser<T> = Function(List<LabeledValue<T>>);

class OptionPicker<T> extends StatelessWidget {
  final String title;
  final String emptyText;
  final List<LabeledValue<T>> initialSelected;
  final List<LabeledValue<T>> options;
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
    final theme = SemanticTheme.of(context);

    final List<Widget> columnChildren = [];

    if (title != null && title.isNotEmpty) {
      final titleWidget = Text(
        title,
        style: theme.typography.title.textStyle(
          color: theme.color.text.generalPrimary,
        ),
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

  _onOptionTap(LabeledValue<T> option) {
    List<LabeledValue<T>> selectedOptions;

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
  final List<LabeledValue<T>> options;
  final List<LabeledValue<T>> selectedOptions;
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

  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    List<LabeledValue<T>> _selectedOptions = selectedOptions ?? [];
    List<Widget> optionsList = [];

    if (options != null && options.isNotEmpty) {
      if (_selectedOptions.isEmpty) {
        _selectedOptions.add(options[0]);
      }

      for (LabeledValue<T> option in options) {
        final dropdownOption = _Option<T>(
          name: option.label,
          value: option.value,
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
      padding: EdgeInsets.symmetric(
        vertical: theme.distance.padding.vertical.medium,
      ),
      child: Column(
        children: optionsList,
      ),
    );
  }
}

class _Option<T> extends StatelessWidget {
  final String name;
  final T value;
  final Function onTap;
  final bool canToggle;
  final bool selected;

  final _checkIcon = SmallIcon.boxChecked;
  final _uncheckedIcon = SmallIcon.boxUnchecked;

  _Option({
    this.name,
    this.value,
    this.onTap,
    bool canToggle,
    this.selected,
  }) : canToggle = canToggle ?? false;

  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    List<Widget> rowChildren = [];

    if (canToggle) {
      final generalIconColor = theme.color.icon.generalPrimary;
      Widget checkedIcon = Padding(
        padding: EdgeInsets.only(
          right: theme.distance.padding.horizontal.medium,
        ),
        child: _checkIcon.buildWidget(
          color: generalIconColor,
        ),
      );
      Widget uncheckedIcon = Padding(
        padding: EdgeInsets.only(
          right: theme.distance.padding.horizontal.medium,
        ),
        child: _uncheckedIcon.buildWidget(color: generalIconColor),
      );

      selected ? rowChildren.add(checkedIcon) : rowChildren.add(uncheckedIcon);
    }

    final optionTitle = Text(
      name,
      style: (selected || canToggle)
          ? theme.typography.body.textStyle(
              color: theme.color.text.generalPrimary,
            )
          : theme.typography.body.textStyle(
              color: theme.color.text.generalSecondary,
            ),
    );

    final optionPadding = EdgeInsets.symmetric(
      horizontal: theme.distance.padding.horizontal.small,
      vertical: theme.distance.padding.vertical.large,
    );

    rowChildren.add(optionTitle);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: theme.color.stroke.medium),
        ),
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
