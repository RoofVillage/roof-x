import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:floating_artboard_templates/index.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart';
import 'package:haptics/index.dart';

import 'mixins/index.dart';

class DatePickerFloatingArtboard extends FloatingArtboard {
  final bool isRange;
  final DateTime startBound;
  final DateTime endBound;
  final DateTime selectedDate;

  DatePickerFloatingArtboard(
      {this.isRange: false, this.startBound, this.endBound, this.selectedDate});

  _DatePickerFloatingArtboardState createState() =>
      _DatePickerFloatingArtboardState();
}

class _DatePickerFloatingArtboardState extends State<DatePickerFloatingArtboard>
    with FloatingArtboardState {
  DateTime selectedDate;

  void initState() {
    super.initState();
    selectedDate = widget.selectedDate;
  }

  setDate(DateTime newDate) {
    Haptic.triggerWith(HapticOption.click);
    setState(() {
      selectedDate = newDate;
    });
  }

  save() {
    Haptic.triggerWith(HapticOption.medium);
    Navigator.pop(context, selectedDate);
  }

  @override
  List<Widget> buildChildren(BuildContext context) {
    final theme = RoofTheme.of(context);
    final headerStyle =
        RoofTypography.heading2.textStyleWithColor(theme.color.text.brand);
    final daysPrimaryStyle = RoofTypography.bodyPrimaryThick
        .textStyleWithColor(theme.color.text.primary);
    final inactiveTextStyle = RoofTypography.bodyPrimary
        .textStyleWithColor(theme.color.text.secondary);
    final smallTextStyle =
        RoofTypography.bodySecondary.textStyleWithColor(theme.color.text.brand);
    final todayTextStyle = RoofTypography.bodyPrimaryThick
        .textStyleWithColor(theme.color.text.transitionAction);

    return [
      Container(
        child: CalendarCarousel(
          selectedDateTime: selectedDate,
          onDayPressed: (DateTime newDate, List newList) => setDate(newDate),
          minSelectedDate: widget.startBound,
          maxSelectedDate: widget.endBound,
          weekendTextStyle: daysPrimaryStyle,
          daysTextStyle: daysPrimaryStyle,
          todayButtonColor: Colors.transparent,
          todayBorderColor: Colors.transparent,
          selectedDayTextStyle: daysPrimaryStyle,
          todayTextStyle: todayTextStyle,
          selectedDayButtonColor: theme.color.background.submitButton,
          inactiveDaysTextStyle: inactiveTextStyle,
          nextDaysTextStyle: inactiveTextStyle,
          prevDaysTextStyle: inactiveTextStyle,
          headerTextStyle: headerStyle,
          weekdayTextStyle: smallTextStyle,
          iconColor: theme.color.icon.logo,
          weekFormat: false,
          daysHaveCircularBorder: true,
          height: 400,
        ),
      ),
    ];
  }
}
