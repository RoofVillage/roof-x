import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:spec/index.dart';
import 'package:haptics/index.dart';
import 'package:typography/index.dart';
import 'package:theme/index.dart';

import '_overflow_roller_column.dart';
import '_clock_type_roller_column.dart';
import '_clock_type.dart';

class RoofTimePicker extends StatefulWidget {
  final TimeOfDay initialValue;

  RoofTimePicker({this.initialValue});

  RoofTimePickerState createState() => RoofTimePickerState();
}

class RoofTimePickerState extends State<RoofTimePicker> {
  final List<int> _minutesList = [
    00,
    05,
    10,
    15,
    20,
    25,
    30,
    35,
    40,
    45,
    50,
    55
  ];
  final List<int> _hoursList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  final List<ClockType> _clockTypeList = [ClockType.am, ClockType.pm];
  final double _stepHeight = 40;
  final int _boundaryStepCount = 1;

  TimeOfDay selectedTime;
  ScrollController _hoursScrollController;
  ScrollController _minutesScrollController;
  ScrollController _clockTypeScrollController;
  bool _shouldSnapHours = true;
  bool _shouldSnapMinutes = true;
  bool _shouldSnapClockType = true;
  ClockType _clockType;

  @override
  void initState() {
    super.initState();
    selectedTime = widget.initialValue ?? TimeOfDay.now();

    if (selectedTime.hour > 11)
      _clockType = ClockType.pm;
    else
      _clockType = ClockType.am;

    final int hoursInitialOffsetSteps = _hoursList.length -
        _boundaryStepCount +
        _hoursList.indexOf((selectedTime.hour) % 12);

    _hoursScrollController = ScrollController(
      initialScrollOffset: hoursInitialOffsetSteps * _stepHeight,
    );

    if (!_minutesList.contains(selectedTime.minute)) {
      // Find minutes value nearest to current time
      if (selectedTime.minute > 57 || selectedTime.minute < 3) {
        selectedTime = TimeOfDay(
          hour: selectedTime.hour,
          minute: _minutesList[0],
        );
      } else {
        for (var i = 0; i < _minutesList.length; i++) {
          final minutesGap = _minutesList[1] - _minutesList[0];

          if ((_minutesList[i] - selectedTime.minute).abs() < minutesGap / 2) {
            selectedTime =
                TimeOfDay(hour: selectedTime.hour, minute: _minutesList[i]);
          }
        }
      }
    }

    final int minutesInitialOffset = _minutesList.length -
        _boundaryStepCount +
        _minutesList.indexOf(selectedTime.minute);

    _minutesScrollController = ScrollController(
      initialScrollOffset: minutesInitialOffset * _stepHeight,
    );

    _clockTypeScrollController = ScrollController(
      initialScrollOffset: _clockTypeList.indexOf(_clockType) * _stepHeight,
    );
  }

  @override
  dispose() {
    _hoursScrollController.dispose();
    _minutesScrollController.dispose();
    _clockTypeScrollController.dispose();
    super.dispose();
  }

  void _handleRollover({controller, segmentLength}) {
    final double segmentHeight = segmentLength * _stepHeight;

    /*
    Rollers are divided into three repeated segments. 
    To create perceived infinite scroll, adjust controller position to keep scroll window in the middle segment.
    */
    if (controller.offset > segmentHeight * 2)
      controller.position.correctBy(-segmentHeight);
    else if (controller.offset < segmentHeight)
      controller.position.correctBy(segmentHeight);
  }

  void _snapScroll({ScrollController controller, int listLength}) {
    Future.delayed(Duration(milliseconds: 50), () {
      double targetOffset = 0;

      if (controller.offset % _stepHeight == 0) return;

      for (var i = 0; i < listLength; i++) {
        final distanceFromMiddle =
            ((_stepHeight * i + _stepHeight * .5) - controller.offset).abs();
        if (distanceFromMiddle < _stepHeight) targetOffset = _stepHeight * i;
      }
      if ((controller == _minutesScrollController && _shouldSnapMinutes) ||
          (controller == _hoursScrollController && _shouldSnapHours) ||
          (controller == _clockTypeScrollController && _shouldSnapClockType))
        controller.animateTo(
          targetOffset,
          duration: RoofDuration.short,
          curve: RoofCurve.quick,
        );
    });
  }

  _getSelectedValue({double scrollOffset, List list}) {
    for (var i = 0; i < list.length * 3; i++) {
      final double stepCenterOffset =
          (i - _boundaryStepCount - .5) * _stepHeight;

      if ((stepCenterOffset - scrollOffset).abs() < _stepHeight) {
        return list[i % list.length];
      }
    }
    return null;
  }

  void _onHoursScroll() {
    int selectedHour = _getSelectedValue(
      scrollOffset: _hoursScrollController.offset,
      list: _hoursList,
    );

    if (_clockType == ClockType.pm) selectedHour += 12;

    if (selectedHour != selectedTime.hour) {
      triggerHapticWith(HapticOption.click);
      setState(() {
        selectedTime = TimeOfDay(
          hour: selectedHour,
          minute: selectedTime.minute,
        );
      });
    }

    _handleRollover(
      controller: _hoursScrollController,
      segmentLength: _hoursList.length,
    );
  }

  void _onMinutesScroll() {
    int selectedMinute = _getSelectedValue(
      scrollOffset: _minutesScrollController.offset,
      list: _minutesList,
    );

    if (selectedMinute != selectedTime.minute) {
      triggerHapticWith(HapticOption.click);
      setState(() {
        selectedTime = TimeOfDay(
          hour: selectedTime.hour,
          minute: selectedMinute,
        );
      });
    }

    _handleRollover(
      controller: _minutesScrollController,
      segmentLength: _minutesList.length,
    );
  }

  _getClockTypeValue() {
    if (_clockTypeScrollController.offset > _stepHeight / 2)
      return ClockType.pm;
    else
      return ClockType.am;
  }

  void _onClockTypeScroll() {
    _shouldSnapClockType = true;

    ClockType selectedClockType = _getClockTypeValue();

    if (selectedClockType != _clockType) {
      triggerHapticWith(HapticOption.click);
      int newHourVal = selectedClockType == ClockType.pm
          ? selectedTime.hour + 12
          : selectedTime.hour - 12;
      setState(() {
        _clockType = selectedClockType;
        selectedTime = TimeOfDay(hour: newHourVal, minute: selectedTime.minute);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double columnWidth = _stepHeight * 1.5;

    hoursTextMask(list, i) {
      return (list[i % list.length]).toString();
    }

    adjustHours(int hourVal) {
      if (_clockType == ClockType.pm)
        return hourVal - 12;
      else
        return hourVal;
    }

    final Widget hoursColumn = Container(
      width: columnWidth,
      child: NotificationListener<Notification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollEndNotification) {
            _shouldSnapHours = true;
            _snapScroll(
              controller: _hoursScrollController,
              listLength: _hoursList.length * 3,
            );
          } else if (scrollNotification is ScrollUpdateNotification) {
            _shouldSnapHours = false;
            _onHoursScroll();
          }
        },
        child: ListView(
          controller: _hoursScrollController,
          padding: EdgeInsets.all(0),
          children: [
            OverflowRollerColumn(
              selectedValue: selectedTime.hour,
              stepHeight: _stepHeight,
              list: _hoursList,
              textMask: hoursTextMask,
              adjustValue: adjustHours,
            )
          ],
        ),
      ),
    );

    final timeDividerTextStyle = RoofTypography.bodyPrimary.textStyleWithColor(
      RoofTheme.of(context).color.text.secondary,
    );
    final Widget timeDivider = Container(
      height: _stepHeight,
      child: Center(
        child: Text(
          ":",
          style: timeDividerTextStyle,
        ),
      ),
    );

    minutesTextMask(List list, int i) {
      return list[i].toString().padLeft(2, "0");
    }

    final Widget minutesColumn = Container(
      width: columnWidth,
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollEndNotification) {
            _shouldSnapMinutes = true;
            _snapScroll(
              controller: _minutesScrollController,
              listLength: _minutesList.length * 3,
            );
          } else if (scrollNotification is ScrollUpdateNotification) {
            _shouldSnapMinutes = false;
            _onMinutesScroll();
          }
        },
        child: ListView(
          controller: _minutesScrollController,
          padding: EdgeInsets.all(0),
          children: [
            OverflowRollerColumn(
              selectedValue: selectedTime.minute,
              stepHeight: _stepHeight,
              list: _minutesList,
              textMask: minutesTextMask,
            ),
          ],
        ),
      ),
    );

    final Widget clockTypeColumn = Container(
      width: _stepHeight,
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollEndNotification) {
            _shouldSnapClockType = true;
            _snapScroll(
              controller: _clockTypeScrollController,
              listLength: _clockTypeList.length,
            );
          } else if (scrollNotification is ScrollUpdateNotification) {
            _shouldSnapClockType = false;
            _onClockTypeScroll();
          }
        },
        child: ListView(
          controller: _clockTypeScrollController,
          padding: EdgeInsets.symmetric(
            vertical: _boundaryStepCount * _stepHeight,
          ),
          children: [
            ClockTypeRollerColumn(
              stepHeight: _stepHeight,
              selectedClockType: _clockType,
            )
          ],
        ),
      ),
    );

    final int totalSteps = _boundaryStepCount * 2 + 1;

    return Container(
      height: totalSteps * _stepHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          hoursColumn,
          timeDivider,
          minutesColumn,
          clockTypeColumn,
        ],
      ),
    );
  }
}