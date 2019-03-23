import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:floating_artboard_templates/index.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart';

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

class _DatePickerFloatingArtboardState
    extends State<DatePickerFloatingArtboard> {
  DateTime selectedDate;

  setDate(DateTime newDate) {
    setState(() {
      selectedDate = newDate;
    });
    if (!widget.isRange) {
      Navigator.pop(context, selectedDate);
    }
  }

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

    selectedDate = widget.selectedDate;

    return Center(
      child: Column(
        children: [
          Container(
            height: 600,
            color: theme.color.background.general,
            child: CalendarCarousel(
              onDayPressed: (DateTime newDate, List newList) =>
                  setDate(newDate),
              minSelectedDate: widget.startBound,
              maxSelectedDate: widget.endBound,
              weekendTextStyle: daysPrimaryStyle,
              daysTextStyle: daysPrimaryStyle,
              todayButtonColor: Colors.transparent,
              todayBorderColor: Colors.transparent,
              todayTextStyle: todayTextStyle,
              selectedDayButtonColor: theme.color.background.submitButton,
              inactiveDaysTextStyle: inactiveTextStyle,
              nextDaysTextStyle: inactiveTextStyle,
              prevDaysTextStyle: inactiveTextStyle,
              headerTextStyle: headerStyle,
              iconColor: theme.color.icon.logo,
              weekdayTextStyle: smallTextStyle,
              weekFormat: false,
              height: 420,
              width: 320,
              selectedDateTime: selectedDate,
              daysHaveCircularBorder: true,
            ),
          ),
          // Container(
          //   color: Colors.blue,
          //   height: 40,
          //   width: 200,
          // ),
        ],
      ),
    );
  }
}
