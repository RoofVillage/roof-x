import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:theme/index.dart';
import 'package:haptics/index.dart';
import 'package:padding/index.dart' as padding;
import 'package:distance/index.dart' as distance;
import 'package:duration/index.dart' as duration;
import 'package:curve/index.dart' as curve;
import 'package:corner_radius/index.dart' as corner_radius;
import 'package:typography/index.dart' as typography;

import '_widgets/index.dart';

class RoofSelectFieldOptionData {
  String title;
  String data;

  RoofSelectFieldOptionData({this.title, this.data});
}

class RoofSelectField extends StatefulWidget {
  final String title;
  final String emptyText;
  final List<RoofSelectFieldOptionData> selectedOptions;
  final List<RoofSelectFieldOptionData> options;
  final bool isMultiSelect;
  final Function(List<RoofSelectFieldOptionData>) onChanged;

  const RoofSelectField(
      {this.title,
      this.emptyText,
      this.selectedOptions,
      this.options,
      this.isMultiSelect,
      this.onChanged});

  @override
  _RoofSelectFieldState createState() => _RoofSelectFieldState();
}

class _RoofSelectFieldState extends State<RoofSelectField>
    with SingleTickerProviderStateMixin {
  List<RoofSelectFieldOptionData> selectedOptions;
  List<RoofSelectFieldOptionData> options;
  bool isExpanded = false;

  @override
  void initState() {
    selectedOptions = widget.selectedOptions;
    options = widget.options;
    if (selectedOptions == null && !widget.isMultiSelect)
      selectedOptions = [options[0]];
    isExpanded = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget label = RoofFieldLabel(labelText: widget.title);

    final selectedOptionsContainer = _SelectedOptionsContainer(
        selectedOptionsText: _textForSelectedOptions(),
        emptyText: widget.emptyText,
        onTap: _expandDropdown,
        isExpanded: isExpanded);

    final dropdownContainer = _DropdownContainer(
      options: options,
      selectedOptions: selectedOptions,
      isMultiSelect: widget.isMultiSelect,
      isExpanded: isExpanded,
      onTap: _onTap,
    );

    return Container(
      margin: padding.field1,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [label, selectedOptionsContainer, dropdownContainer]),
    );
  }

  String _textForSelectedOptions() {
    var text = "";
    for (var i = 0; i < selectedOptions.length; i++) {
      bool isLast = i == selectedOptions.length - 1;
      text += selectedOptions[i].title;
      if (!isLast) text += ", ";
    }
    return text;
  }

  void _onTap(RoofSelectFieldOptionData option) {
    widget.onChanged(selectedOptions);
    _updateSelectedOptions(option);
  }

  HapticOption get _hapticOption {
    if (widget.isMultiSelect) return HapticOption.light;
    return (isExpanded) ? HapticOption.medium : HapticOption.light;
  }

  void _updateSelectedOptions(RoofSelectFieldOptionData option) {
    if (widget.isMultiSelect) {
      final optionIsSelected = selectedOptions.contains(option);
      setState(() {
        optionIsSelected
            ? selectedOptions.remove(option)
            : selectedOptions.add(option);
      });
    } else {
      setState(() {
        selectedOptions.first = option;
        isExpanded = !isExpanded;
      });
    }
  }

  void _expandDropdown() {
    final hapticOption = isExpanded ? HapticOption.medium : HapticOption.light;
    triggerHapticWith(hapticOption);
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}

class _SelectedOptionsContainer extends StatelessWidget {
  final String selectedOptionsText;
  final String emptyText;
  final Function onTap;
  final bool isExpanded;

  final _typographyStyle = typography.bodyPrimary;
  final _maxLines = 10;

  final _upArrowIconReferece = StandardIcon.upArrow;
  final _downArrowIconReferece = StandardIcon.downArrow;

  _SelectedOptionsContainer(
      {this.selectedOptionsText, this.emptyText, this.onTap, this.isExpanded});

  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    Widget selectedOptionsChild;
    if (selectedOptionsText.isEmpty) {
      selectedOptionsChild = Text(emptyText,
          style: _typographyStyle
              .textStyleWithColor(theme.color.text.placeholder));
    } else {
      selectedOptionsChild = Expanded(
          child: Text(
        selectedOptionsText,
        style: _typographyStyle.textStyleWithColor(theme.color.text.primary),
        softWrap: true,
        maxLines: _maxLines,
        overflow: TextOverflow.ellipsis,
      ));
    }

    final generalIconColor = theme.color.icon.general;
    final upArrow = _upArrowIconReferece.buildWidget(color: generalIconColor);
    final downArrow = _downArrowIconReferece.buildWidget(color: generalIconColor);

    final animatedArrow = Expanded(
      flex: 0,
      child: Padding(
        padding: EdgeInsets.fromLTRB(distance.d, 0, 0, 0),
        child: _AnimatedIconReference(
            icon1: upArrow, icon2: downArrow, showIcon1: isExpanded),
      ),
    );

    final verticalPadding = EdgeInsets.symmetric(vertical: distance.b);

    return Container(
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: theme.color.stroke.light))),
        child: GestureDetector(
            onTap: onTap,
            behavior: HitTestBehavior.opaque,
            child: Padding(
                padding: verticalPadding,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [selectedOptionsChild, animatedArrow]))));
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
            showIcon1 ? CrossFadeState.showFirst : CrossFadeState.showSecond);
  }
}

class _DropdownContainer extends StatelessWidget {
  final List<RoofSelectFieldOptionData> options;
  final List<RoofSelectFieldOptionData> selectedOptions;
  final bool isMultiSelect;
  final bool isExpanded;
  final Function onTap;

  final _closeDuration = duration.short;
  final _showDuration = duration.short;

  _DropdownContainer(
      {this.options,
      this.selectedOptions,
      this.isMultiSelect,
      this.isExpanded,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: corner_radius.small, bottomRight: corner_radius.small),
        color: theme.color.background.generalSecondary,
        boxShadow: [theme.shadow]);

    final Widget expandedChild = _DropdownContents(
        options: options,
        selectedOptions: selectedOptions,
        isMultiSelect: isMultiSelect,
        onTap: onTap);

    return Container(
        decoration: decoration,
        child: AnimatedCrossFade(
            firstChild: expandedChild,
            secondChild: Container(),
            firstCurve: Curves.easeIn,
            secondCurve: Curves.easeIn,
            sizeCurve: curve.easy,
            crossFadeState: isExpanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: isExpanded ? _closeDuration : _showDuration));
  }
}

class _DropdownContents extends StatelessWidget {
  final List options;
  final List selectedOptions;
  final bool isMultiSelect;
  final Function onTap;

  final double _optionHeight = 60;
  final double _optionsVisible = 4.5;

  _DropdownContents(
      {this.options, this.selectedOptions, this.isMultiSelect, this.onTap});

  Widget build(BuildContext context) {
    List<Widget> optionsList = [];
    for (var option in options) {
      final dropdownOption = _DropdownOption(
          name: option.title,
          data: option.data,
          selected: selectedOptions.contains(option),
          isMultiSelect: isMultiSelect,
          optionHeight: _optionHeight,
          onTap: () => onTap(option));
      optionsList.add(dropdownOption);
    }

    double totalDropdownHeight;
    if (optionsList.length.toDouble() <= _optionsVisible) {
      totalDropdownHeight = _optionHeight * optionsList.length.toDouble();
    } else
      totalDropdownHeight = _optionHeight * _optionsVisible;

    return Container(
        height: totalDropdownHeight,
        child: ListView(children: optionsList, padding: EdgeInsets.all(0)));
  }
}

class _DropdownOption extends StatelessWidget {
  final String name;
  final String data;
  final double optionHeight;
  final Function onTap;
  final bool isMultiSelect;
  final bool selected;

  final _typographyStyle = typography.bodySecondary;
  final _checkIcon = SmallIcon.boxChecked;
  final _uncheckedIcon = SmallIcon.boxUnchecked;

  _DropdownOption(
      {this.name,
      this.data,
      this.optionHeight,
      this.onTap,
      this.isMultiSelect,
      this.selected});

  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    List<Widget> rowChildren = [];

    if (isMultiSelect) {
      final generalIconColor = theme.color.icon.general;
      Widget checkedIcon = Padding(
          padding: EdgeInsets.fromLTRB(0, 0, distance.b, 0),
          child: _checkIcon.buildWidget(color: generalIconColor));
      Widget uncheckedIcon = Padding(
          padding: EdgeInsets.fromLTRB(0, 0, distance.b, 0),
          child: _uncheckedIcon.buildWidget(color: generalIconColor));

      selected ? rowChildren.add(checkedIcon) : rowChildren.add(uncheckedIcon);
    }

    final optionTitle = Text(name,
        style: _typographyStyle.textStyleWithColor(theme.color.text.primary));

    final optionBackgroundColor = (selected && !isMultiSelect)
        ? theme.color.background.generalPrimary
        : Colors.transparent;

    final optionPadding =
        EdgeInsets.fromLTRB(distance.b, distance.c, distance.b, distance.c);

    rowChildren.add(optionTitle);

    return Container(
        decoration: BoxDecoration(
          color: optionBackgroundColor,
        ),
        height: optionHeight,
        child: GestureDetector(
            onTap: onTap,
            behavior: HitTestBehavior.opaque,
            child: Padding(
                padding: optionPadding,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: rowChildren))));
  }
}
