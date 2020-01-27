import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:standard_icon_library/index.dart';
import 'package:date/index.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

typedef DateTimePasser = Function(Date);

class CalendarDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final DateTime startBound;
  final DateTime endBound;
  final DateTimePasser onDayPressed;

  final double _height = 400;

  CalendarDatePicker({
    DateTime selectedDate,
    @required this.onDayPressed,
    this.startBound,
    this.endBound,
  }) : selectedDate = selectedDate ?? DateTime.now();

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final headerStyle = theme.typography.headingSecondary.textStyle(
      color: theme.color.text.brand,
    );

    final daysPrimaryStyle = theme.typography.bodyHeavy.textStyle(
      color: theme.color.text.generalPrimary,
    );

    final inactiveTextStyle = theme.typography.body.textStyle(
      color: theme.color.text.generalSecondary,
    );

    final smallTextStyle = theme.typography.body.textStyle(
      color: theme.color.text.brand,
    );

    final todayTextStyle = theme.typography.bodyHeavy.textStyle(
      color: theme.color.text.action,
    );

    final arrowIconColor = theme.color.text.brand;

    final leftIcon = StandardIcon.leftArrow.buildWidget(
      color: arrowIconColor,
    );
    final rightIcon = StandardIcon.rightArrow.buildWidget(
      color: arrowIconColor,
    );

    return Container(
      child: CalendarCarousel(
        selectedDateTime: selectedDate,
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
        selectedDayButtonColor: theme.color.background.actionPrimary,
        inactiveDaysTextStyle: inactiveTextStyle,
        nextDaysTextStyle: inactiveTextStyle,
        prevDaysTextStyle: inactiveTextStyle,
        headerTextStyle: headerStyle,
        weekdayTextStyle: smallTextStyle,
        iconColor: theme.color.icon.logo,
        weekFormat: false,
        daysHaveCircularBorder: true,
        height: _height,
        leftButtonIcon: leftIcon,
        rightButtonIcon: rightIcon,
      ),
    );
  }

  void _onDayPressed(DateTime newDate) {
    final date = Date.fromDateTime(newDate);
    onDayPressed(date);
  }
}
