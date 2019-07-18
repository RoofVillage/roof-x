import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:standard_icon_library/index.dart';
import 'package:distance/index.dart' as distance;
import 'package:typography/index.dart' as typography;
import 'package:labeled_icon/index.dart';

typedef SelectedIconPasser = Function(LabeledIcon);

class IconPicker extends StatelessWidget {
  final String title;
  final LabeledIcon selectedOption;
  final List<LabeledIcon> options;
  final SelectedIconPasser onChanged;

  IconPicker({
    this.title,
    this.selectedOption,
    @required this.options,
    this.onChanged,
  });

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

    final iconsGrid = _IconsGrid(
      options: options,
      selectedOption: selectedOption,
      onTap: onChanged,
    );
    columnChildren.add(iconsGrid);

    return Container(
      child: Column(
        children: columnChildren,
      ),
    );
  }
}

class _IconsGrid extends StatelessWidget {
  final List<LabeledIcon> options;
  final LabeledIcon selectedOption;
  final Function onTap;

  final _verticalPadding = distance.c;
  final _horizontalPadding = distance.b;

  _IconsGrid({
    this.options,
    this.selectedOption,
    this.onTap,
  });

  Widget build(BuildContext context) {
    final _selectedOption = selectedOption ?? options.first;

    List<_IconOption> optionsList = options.map(
      (option) {
        return _IconOption(
          icon: option.icon,
          selected: _selectedOption == option,
          onTap: () => onTap(option),
        );
      },
    ).toList();

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: _verticalPadding,
        horizontal: _horizontalPadding,
      ),
      child: Column(
        children: [
          Wrap(children: optionsList),
        ],
      ),
    );
  }
}

class _IconOption extends StatelessWidget {
  final StandardIcon icon;
  final Function onTap;
  final bool selected;

  final _padding = distance.c;

  _IconOption({
    this.icon,
    this.onTap,
    this.selected,
  });

  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final selectedColor = theme.color.icon.action;
    final unselectedColor = theme.color.icon.general;

    final iconWidget = icon.buildWidget(
      color: selected ? selectedColor : unselectedColor,
    );

    return Container(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: EdgeInsets.all(_padding),
          child: iconWidget,
        ),
      ),
    );
  }
}
