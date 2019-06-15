import 'package:flutter/material.dart';
import 'package:standard_icon_library/index.dart';
import 'package:theme/index.dart';
import 'package:haptics/index.dart';
import 'package:padding/index.dart' as padding;
import 'package:distance/index.dart' as distance;
import 'package:duration/index.dart' as duration;
import 'package:curve/index.dart' as curve;
import 'package:corner_radius/index.dart' as corner_radius;

import '_widgets/index.dart';

class IconSelectFieldOptionData {
  StandardIcon icon;

  IconSelectFieldOptionData({this.icon});
}

class IconSelectField extends StatefulWidget {
  final String title;
  final IconSelectFieldOptionData selectedOption;
  final List<IconSelectFieldOptionData> options;
  final Function(IconSelectFieldOptionData) onChanged;

  const IconSelectField({
    this.title,
    this.selectedOption,
    this.options,
    this.onChanged,
  });

  @override
  _IconSelectFieldState createState() => _IconSelectFieldState();
}

class _IconSelectFieldState extends State<IconSelectField>
    with SingleTickerProviderStateMixin {
  IconSelectFieldOptionData selectedOption;
  List<IconSelectFieldOptionData> options;
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
    Widget label = RoofFieldLabel(labelText: widget.title);

    final collapsedViewContainer = _CollapsedViewContainer(
      selectedOption: selectedOption,
      onTap: _expandDropdown,
      isExpanded: isExpanded,
    );

    final dropdownContainer = _DropdownContainer(
      options: options,
      selectedOption: selectedOption,
      isExpanded: isExpanded,
      onTap: _onTap,
    );

    return Container(
      margin: padding.field1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [label, collapsedViewContainer, dropdownContainer],
      ),
    );
  }

  void _onTap(IconSelectFieldOptionData option) {
    widget.onChanged(selectedOption);
    _updateSelectedOptions(option);
  }

  HapticOption get _hapticOption {
    return (isExpanded) ? HapticOption.medium : HapticOption.light;
  }

  void _updateSelectedOptions(IconSelectFieldOptionData option) {
    setState(() {
      selectedOption = option;
      isExpanded = !isExpanded;
    });
  }

  void _expandDropdown() {
    triggerHapticWith(_hapticOption);
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}

class _CollapsedViewContainer extends StatelessWidget {
  final IconSelectFieldOptionData selectedOption;
  final String emptyText;
  final Function onTap;
  final bool isExpanded;

  final _upArrowIconReferece = StandardIcon.upArrow;
  final _downArrowIconReferece = StandardIcon.downArrow;

  _CollapsedViewContainer({
    this.selectedOption,
    this.emptyText,
    this.onTap,
    this.isExpanded,
  });

  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final generalIconColor = theme.color.icon.general;

    final selectedIconWidget =
        selectedOption.icon.buildWidget(color: generalIconColor);

    final upArrow = _upArrowIconReferece.buildWidget(color: generalIconColor);
    final downArrow =
        _downArrowIconReferece.buildWidget(color: generalIconColor);

    final animatedArrow = Expanded(
      flex: 0,
      child: Padding(
        padding: EdgeInsets.fromLTRB(distance.d, 0, 0, 0),
        child: _AnimatedIconReference(
          icon1: upArrow,
          icon2: downArrow,
          showIcon1: isExpanded,
        ),
      ),
    );

    final verticalPadding = EdgeInsets.symmetric(vertical: distance.b);

    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: theme.color.stroke.light))),
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: verticalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [selectedIconWidget, animatedArrow],
          ),
        ),
      ),
    );
  }
}

class _AnimatedIconReference extends StatelessWidget {
  final Widget icon1;
  final Widget icon2;
  final bool showIcon1;

  _AnimatedIconReference({this.icon1, this.icon2, this.showIcon1});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: icon1,
      secondChild: icon2,
      duration: duration.short,
      crossFadeState:
          showIcon1 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}

class _DropdownContainer extends StatelessWidget {
  final List<IconSelectFieldOptionData> options;
  final IconSelectFieldOptionData selectedOption;
  final bool isMultiSelect;
  final bool isExpanded;
  final Function onTap;

  final _closeDuration = duration.short;
  final _showDuration = duration.short;

  _DropdownContainer({
    this.options,
    this.selectedOption,
    this.isMultiSelect,
    this.isExpanded,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: corner_radius.small,
        bottomRight: corner_radius.small,
      ),
      color: theme.color.background.generalSecondary,
      boxShadow: [theme.shadow],
    );

    final Widget expandedChild = _DropdownContents(
      options: options,
      selectedOption: selectedOption,
      isMultiSelect: isMultiSelect,
      onTap: onTap,
    );

    return Container(
      decoration: decoration,
      child: AnimatedCrossFade(
        firstChild: expandedChild,
        secondChild: Container(),
        firstCurve: Curves.easeIn,
        secondCurve: Curves.easeIn,
        sizeCurve: curve.easy,
        crossFadeState:
            isExpanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: isExpanded ? _closeDuration : _showDuration,
      ),
    );
  }
}

class _DropdownContents extends StatelessWidget {
  final List<IconSelectFieldOptionData> options;
  final IconSelectFieldOptionData selectedOption;
  final bool isMultiSelect;
  final Function onTap;

  final double _maxVisibleHeight = 126; // standardIcon height * 4.5

  _DropdownContents({
    this.options,
    this.selectedOption,
    this.isMultiSelect,
    this.onTap,
  });

  Widget build(BuildContext context) {
    List<_DropdownOption> optionsList = options.map((option) {
      return _DropdownOption(
        icon: option.icon,
        selected: selectedOption == option,
        onTap: () => onTap(option),
      );
    }).toList();

    return Container(
      constraints: BoxConstraints(maxHeight: _maxVisibleHeight),
      child: Wrap(
        children: optionsList,
      ),
    );
  }
}

class _DropdownOption extends StatelessWidget {
  final StandardIcon icon;
  final Function onTap;
  final bool selected;

  final _padding = distance.b;

  _DropdownOption({
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
