import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:haptics/index.dart';
import 'package:typography/index.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

class RoofCalendarDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final DateTime startBound;
  final DateTime endBound;
  final Function(DateTime) onDayPressed;

  RoofCalendarDatePicker({
    this.selectedDate,
    this.startBound,
    this.endBound,
    @required this.onDayPressed,
  });

  @override
  Widget build(BuildContext context) {
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

    _onDayPressed(DateTime newDate) {
      Haptic.triggerWith(HapticOption.click);
      onDayPressed(newDate);
    }

    return Container(
      child: CalendarCarousel(
        selectedDateTime: selectedDate ?? DateTime.now(),
        onDayPressed: (DateTime newDate, List newList) =>
            _onDayPressed(newDate),
        minSelectedDate: startBound,
        maxSelectedDate: endBound,
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
    );
  }
}
