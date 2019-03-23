import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:floating_artboard_templates/index.dart';

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
    selectedDate = widget.selectedDate;

    return Center(
      child: Container(
        height: 600,
        color: Colors.black,
        child: CalendarCarousel(
          minSelectedDate: widget.startBound,
          maxSelectedDate: widget.endBound,
          onDayPressed: (DateTime newDate, List newList) => setDate(newDate),
          weekendTextStyle: TextStyle(
            color: Colors.red,
          ),
          daysTextStyle: TextStyle(
            color: Colors.white,
          ),
          todayButtonColor: Colors.blue,
          todayBorderColor: Colors.blue,
          selectedDayButtonColor: Colors.yellow,
          selectedDayTextStyle: TextStyle(color: Colors.black),
          weekFormat: false,
          height: 420.0,
          selectedDateTime: selectedDate,
          daysHaveCircularBorder: true,
        ),
      ),
    );
  }
}
