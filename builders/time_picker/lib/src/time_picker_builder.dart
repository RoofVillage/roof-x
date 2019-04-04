import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:haptics/index.dart';
import 'package:typography/index.dart';
import 'package:theme/index.dart';

class TimePicker extends StatefulWidget {
  final TimeOfDay initialValue;

  TimePicker({this.initialValue});

  TimePickerState createState() => TimePickerState();
}

class TimePickerState extends State<TimePicker> {
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
  final List<int> _hoursList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
  final List<ClockType> _clockTypeList = [ClockType.am, ClockType.pm];
  final double _stepHeight = 40;
  final int _stepsVisible = 5;

  TimeOfDay selectedTime;
  ScrollController hoursScrollController;
  ScrollController minutesScrollController;
  ScrollController clockTypeScrollController;
  ClockType clockType;

  void initState() {
    super.initState();
    selectedTime = widget.initialValue ?? TimeOfDay.now();

    if (selectedTime.hour > 11)
      clockType = ClockType.pm;
    else
      clockType = ClockType.am;

    hoursScrollController = ScrollController(
      initialScrollOffset: (_hoursList.length +
              _hoursList.indexOf(selectedTime.hour % _hoursList.length) -
              1) *
          _stepHeight,
    );

    int initialMinutesListIndex = 0;

    for (var i = 0; i < _minutesList.length; i++) {
      final minutesGap = _minutesList[1] - _minutesList[0];

      if ((_minutesList[i] - selectedTime.minute).abs() < minutesGap / 2) {
        initialMinutesListIndex = i;

        if (!_minutesList.contains(selectedTime.minute)) {
          selectedTime = TimeOfDay(
              hour: selectedTime.hour,
              minute: _minutesList[initialMinutesListIndex]);
        }
      }
    }

    minutesScrollController = ScrollController(
      initialScrollOffset:
          (_minutesList.length + initialMinutesListIndex) * _stepHeight,
    );

    clockTypeScrollController = ScrollController(
      initialScrollOffset:
          (1 + _clockTypeList.indexOf(clockType)) * _stepHeight,
    );
  }

  _getSelectedValue({double scrollOffset, List list}) {
    for (var i = 0; i < list.length * 3; i++) {
      if (((_stepHeight * i - _stepHeight * .5) - scrollOffset).abs() <
          _stepHeight) {
        return list[i % list.length];
      }
    }
    return null;
  }

  void snapScroll({ScrollController controller, int listLength}) {
    double animateTo = 0;

    if (controller.offset % _stepHeight == 0) return;

    for (var i = 0; i < listLength; i++) {
      final distanceFromMiddle =
          ((_stepHeight * i + _stepHeight * .5) - controller.offset).abs();
      if (distanceFromMiddle < _stepHeight) animateTo = _stepHeight * i;
    }

    Future.delayed(
      Duration(seconds: 0),
      () => controller.animateTo(
            animateTo,
            duration: RoofDuration.short,
            curve: RoofCurve.quick,
          ),
    );
  }

  void _onHoursScroll() {
    int selectedHour = _getSelectedValue(
      scrollOffset: hoursScrollController.offset,
      list: _hoursList,
    );

    if (clockType == ClockType.pm) selectedHour += 12;

    if (selectedHour != selectedTime.hour) {
      triggerHapticWith(HapticOption.click);
      setState(() {
        selectedTime = TimeOfDay(
          hour: selectedHour,
          minute: selectedTime.minute,
        );
      });
    }

    handleRollover(
      controller: hoursScrollController,
      segmentLength: _hoursList.length,
    );
  }

  void _onMinutesScroll() {
    int selectedMinute = _getSelectedValue(
      scrollOffset: minutesScrollController.offset,
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

    handleRollover(
      controller: minutesScrollController,
      segmentLength: _minutesList.length,
    );
  }

  void _onClockTypeScroll() {
    ClockType selectedClockType = _getSelectedValue(
      scrollOffset: clockTypeScrollController.offset,
      list: _clockTypeList,
    );

    if (selectedClockType != clockType) {
      triggerHapticWith(HapticOption.click);
      int newHourVal = selectedClockType == ClockType.pm
          ? selectedTime.hour + 12
          : selectedTime.hour - 12;
      setState(() {
        clockType = selectedClockType;
        selectedTime = TimeOfDay(hour: newHourVal, minute: selectedTime.minute);
      });
    }
  }

  void handleRollover({controller, segmentLength}) {
    final segmentPixels = segmentLength * _stepHeight;

    if (controller.offset > segmentPixels * 2)
      controller.position.correctBy(-segmentPixels);
    else if (controller.offset < segmentPixels)
      controller.position.correctBy(segmentPixels);
  }

  @override
  Widget build(BuildContext context) {
    final paddingSteps = (_stepsVisible - 1) / 2;
    final padding = EdgeInsets.symmetric(
      vertical: paddingSteps * _stepHeight,
    );

    final columnWidth = _stepHeight * 1.5;

    hoursTextMask(list, i) {
      return (list[i % list.length] + 1).toString();
    }

    final Widget hoursColumn = Container(
      width: columnWidth,
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollEndNotification) {
            snapScroll(
              controller: hoursScrollController,
              listLength: _hoursList.length * 3,
            );
          } else if (scrollNotification is ScrollUpdateNotification) {
            _onHoursScroll();
          }
        },
        child: ListView(
          controller: hoursScrollController,
          padding: padding,
          children: [
            _RollerColumn(
              selectedValue: selectedTime.hour,
              height: _stepHeight,
              list: _hoursList,
              stepsVisible: _stepsVisible,
              textMask: hoursTextMask,
              canRollover: true,
              adjustForClockType: clockType,
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
            snapScroll(
              controller: minutesScrollController,
              listLength: _minutesList.length * 3,
            );
          } else if (scrollNotification is ScrollUpdateNotification) {
            _onMinutesScroll();
          }
        },
        child: ListView(
          controller: minutesScrollController,
          padding: padding,
          children: [
            _RollerColumn(
              selectedValue: selectedTime.minute,
              height: _stepHeight,
              list: _minutesList,
              stepsVisible: _stepsVisible,
              textMask: minutesTextMask,
              canRollover: true,
            ),
          ],
        ),
      ),
    );

    clockTypeTextMask(list, i) {
      if (list[i] == ClockType.am)
        return "am";
      else if (list[i] == ClockType.pm) return "pm";
      return "";
    }

    final Widget clockTypeColumn = Container(
      width: _stepHeight,
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollEndNotification) {
            snapScroll(
              controller: minutesScrollController,
              listLength: _clockTypeList.length,
            );
          } else if (scrollNotification is ScrollUpdateNotification) {
            _onClockTypeScroll();
          }
        },
        child: ListView(
          controller: clockTypeScrollController,
          padding: EdgeInsets.symmetric(vertical: _stepHeight * 2),
          children: [
            _RollerColumn(
              selectedValue: clockType,
              height: _stepHeight,
              list: _clockTypeList,
              stepsVisible: _stepsVisible,
              textMask: clockTypeTextMask,
            )
          ],
        ),
      ),
    );

    return Container(
      height: _stepsVisible * _stepHeight,
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

class _RollerColumn extends StatelessWidget {
  final dynamic selectedValue;
  final List<dynamic> list;
  final double height;
  final int stepsVisible;
  final Function(List<dynamic>, int) textMask;
  final ClockType adjustForClockType;
  final bool canRollover;

  _RollerColumn({
    @required this.selectedValue,
    @required this.list,
    @required this.height,
    @required this.stepsVisible,
    @required this.textMask,
    this.adjustForClockType,
    this.canRollover: false,
  }) : assert(stepsVisible.isOdd);

  final _inactiveTypography = RoofTypography.bodyPrimary;
  final _activeTypography = RoofTypography.bodyPrimaryThick;

  @override
  Widget build(BuildContext context) {
    final activeTextColor = RoofTheme.of(context).color.text.primary;
    final inactiveTextColor = RoofTheme.of(context).color.text.secondary;
    final activeStyle = _activeTypography.textStyleWithColor(activeTextColor);
    final inactiveStyle =
        _inactiveTypography.textStyleWithColor(inactiveTextColor);

    final widgetsLength = canRollover ? list.length * 3 : list.length;

    List<Widget> widgets = [];

    for (var i = 0; i < widgetsLength; i++) {
      final text = textMask(list, i % list.length);

      final adjustedValue = adjustForClockType == ClockType.pm
          ? selectedValue - 12
          : selectedValue;

      final style = i % list.length == list.indexOf(adjustedValue)
          ? activeStyle
          : inactiveStyle;

      widgets.add(
        Container(
          height: height,
          width: height,
          child: Center(
            child: Text(
              text,
              style: style,
            ),
          ),
        ),
      );
    }

    return Container(
      height: widgets.length * height,
      child: Column(children: widgets),
    );
  }
}

enum ClockType { am, pm }
