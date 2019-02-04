import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart';
import 'package:haptics/index.dart';

import 'widgets/index.dart';

class RoofSelectFieldOption {
  String title;
  String data;

  RoofSelectFieldOption({@required this.title, this.data});
}

class RoofSelectField extends StatefulWidget {
  final String title;
  final String emptyText;
  final List<RoofSelectFieldOption> selectedOptions;
  final List<RoofSelectFieldOption> options;
  final bool isMultiSelect;

  const RoofSelectField(
      {this.title,
      this.emptyText,
      this.selectedOptions,
      this.options,
      this.isMultiSelect});

  @override
  _RoofSelectFieldState createState() => _RoofSelectFieldState(
      title: title,
      selectedOptions: selectedOptions,
      options: options,
      isMultiSelect: isMultiSelect);
}

class _RoofSelectFieldState extends State<RoofSelectField>
    with SingleTickerProviderStateMixin {
  String title;
  String emptyText;
  List<RoofSelectFieldOption> selectedOptions;
  List<RoofSelectFieldOption> options;
  bool isMultiSelect;
  bool isExpanded;

  static const _defaultEmptyText = "No selection";
  static const _defaultIsMultiSelect = false;
  static const _defaultSelectedOptions = [];

  _RoofSelectFieldState(
      {this.title,
      this.emptyText = _defaultEmptyText,
      this.selectedOptions = _defaultSelectedOptions,
      this.options,
      this.isMultiSelect = _defaultIsMultiSelect});

  @override
  void initState() {
    if (selectedOptions.length == 0 && !isMultiSelect)
      selectedOptions.add(options[0]);
    isExpanded = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget label = RoofFieldLabel(labelText: title);

    final selectedOptionsContainer = _RoofSelectedOptionsContainer(
        selectedOptionsText: _textForSelectedOptions(),
        emptyText: emptyText,
        onTap: _updateDropdown,
        isExpanded: isExpanded);

    final dropdownContainer = _RoofDropdownContainer(
        options: options,
        selectedOptions: selectedOptions,
        isMultiSelect: isMultiSelect,
        isExpanded: isExpanded,
        onTap: _updateSelectedOptions);

    return Container(
        margin: RoofObjectPadding.field1,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [label, selectedOptionsContainer, dropdownContainer]));
  }

  _textForSelectedOptions() {
    String text = "";
    for (var i = 0; i < selectedOptions.length; i++) {
      bool isLast = i == selectedOptions.length - 1;
      text += selectedOptions[i].title;
      if (!isLast) text += ", ";
    }
    return text;
  }

  _updateSelectedOptions(RoofSelectFieldOption option) {
    RoofHapticOption hapticOption;
    if (isMultiSelect) {
      hapticOption = RoofHapticOption.light;
      final optionIsSelected = selectedOptions.contains(option);
      setState(() {
        optionIsSelected
            ? selectedOptions.remove(option)
            : selectedOptions.add(option);
      });
    } else {
      hapticOption =
          isExpanded ? RoofHapticOption.medium : RoofHapticOption.light;
      setState(() {
        selectedOptions.first = option;
        isExpanded = !isExpanded;
      });
    }
    RoofHaptic.triggerWith(hapticOption);
  }

  _updateDropdown() {
    final hapticOption =
        isExpanded ? RoofHapticOption.medium : RoofHapticOption.light;
    RoofHaptic.triggerWith(hapticOption);
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}

class _RoofSelectedOptionsContainer extends StatelessWidget {
  final String selectedOptionsText;
  final String emptyText;
  final Function onTap;
  final bool isExpanded;

  final _typographyStyle = RoofTypography.body2;
  final _maxLines = 10;

  final _upArrowIconReferece = IconReference.upArrow;
  final _downArrowIconReferece = IconReference.downArrow;

  _RoofSelectedOptionsContainer(
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
          flex: 1,
          child: Text(
            selectedOptionsText,
            style:
                _typographyStyle.textStyleWithColor(theme.color.text.primary),
            softWrap: true,
            maxLines: _maxLines,
            overflow: TextOverflow.ellipsis,
          ));
    }

    final generalIconColor = theme.color.icon.general;
    final upArrow = _upArrowIconReferece.buildSvg(color: generalIconColor);
    final downArrow = _downArrowIconReferece.buildSvg(color: generalIconColor);

    final animatedArrow = Expanded(
      flex: 0,
      child: Padding(
        padding: EdgeInsets.fromLTRB(RoofDistance.d, 0, 0, 0),
        child: _AnimatedIconReference(
            icon1: upArrow, icon2: downArrow, showIcon1: isExpanded),
      ),
    );

    return Container(
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: theme.color.stroke.light))),
        child: GestureDetector(
            onTap: onTap,
            behavior: HitTestBehavior.opaque,
            child: Padding(
                padding:
                    EdgeInsets.fromLTRB(0, RoofDistance.b, 0, RoofDistance.b),
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
        duration: RoofDuration.short,
        crossFadeState:
            showIcon1 ? CrossFadeState.showFirst : CrossFadeState.showSecond);
  }
}

class _RoofDropdownContainer extends StatelessWidget {
  final List<RoofSelectFieldOption> options;
  final List<RoofSelectFieldOption> selectedOptions;
  final bool isMultiSelect;
  final bool isExpanded;
  final Function onTap;

  final double _optionHeight = 60;
  final _closeDuration = RoofDuration.short;
  final _showDuration = RoofDuration.short;

  _RoofDropdownContainer(
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
            bottomLeft: RoofCornerRadius.small,
            bottomRight: RoofCornerRadius.small),
        color: theme.color.background.general,
        boxShadow: [theme.shadow]);
    return Container(
        decoration: decoration,
        child: AnimatedCrossFade(
            firstChild: _RoofDropdownContents(
                options: options,
                selectedOptions: selectedOptions,
                isMultiSelect: isMultiSelect,
                optionHeight: _optionHeight,
                onTap: onTap),
            secondChild: Container(),
            firstCurve: Curves.easeIn,
            secondCurve: Curves.easeIn,
            sizeCurve: Curves.decelerate,
            crossFadeState: isExpanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: isExpanded ? _closeDuration : _showDuration));
  }
}

class _RoofDropdownContents extends StatelessWidget {
  final List<RoofSelectFieldOption> options;
  final List<RoofSelectFieldOption> selectedOptions;
  final bool isMultiSelect;
  final double optionHeight;
  final Function onTap;

  static const double _optionsVisible = 4.5;

  _RoofDropdownContents(
      {this.options,
      this.selectedOptions,
      this.isMultiSelect,
      this.optionHeight,
      this.onTap});

  Widget build(BuildContext context) {
    List<Widget> optionsList = [];
    for (var option in options) {
      final dropdownOption = _RoofDropdownOption(
          name: option.title,
          selected: selectedOptions.contains(option),
          isMultiSelect: isMultiSelect,
          optionHeight: optionHeight,
          onTap: () => onTap(option));

      optionsList.add(dropdownOption);
    }

    double totalDropdownHeight = optionHeight * optionsList.length.toDouble();

    if (totalDropdownHeight > _optionsVisible * optionHeight) {
      totalDropdownHeight = _optionsVisible * optionHeight;
    }

    return Container(
        height: totalDropdownHeight, child: ListView(children: optionsList));
  }
}

class _RoofDropdownOption extends StatelessWidget {
  final String name;
  final double optionHeight;
  final Function onTap;
  final bool isMultiSelect;
  final bool selected;

  final _typographyStyle = RoofTypography.body2;
  final _checkIcon = IconReference.boxChecked;
  final _uncheckedIcon = IconReference.boxUnchecked;

  _RoofDropdownOption(
      {this.name,
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
          padding: EdgeInsets.fromLTRB(0, 0, RoofDistance.b, 0),
          child: _checkIcon.buildSvg(color: generalIconColor));
      Widget uncheckedIcon = Padding(
          padding: EdgeInsets.fromLTRB(0, 0, RoofDistance.b, 0),
          child: _uncheckedIcon.buildSvg(color: generalIconColor));

      selected ? rowChildren.add(checkedIcon) : rowChildren.add(uncheckedIcon);
    }

    final optionTitle = Text(name,
        style: _typographyStyle.textStyleWithColor(theme.color.text.primary));

    rowChildren.add(optionTitle);

    return Container(
        decoration: BoxDecoration(
          color: (selected && !isMultiSelect)
              ? theme.color.background.general
              : Colors.transparent,
          // border: Border(bottom: BorderSide(color: RoofColor.neutralColorC))
        ),
        height: optionHeight,
        child: GestureDetector(
            onTap: onTap,
            behavior: HitTestBehavior.opaque,
            child: Padding(
                padding: EdgeInsets.fromLTRB(RoofDistance.b, RoofDistance.c,
                    RoofDistance.b, RoofDistance.c),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: rowChildren))));
  }
}
