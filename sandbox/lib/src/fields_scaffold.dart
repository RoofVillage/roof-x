import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:artboard/index.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart';
import 'package:haptics/index.dart';
import 'package:full_screen_artboard_templates/index.dart';

class TestingArtboard extends FullScreenArtboard {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      backgroundColor: RoofTheme.of(context).color.background.general,
      body: Center(child: TimePicker()),
    );
  }
}

class TimePicker extends StatefulWidget {
  final TimeOfDay initialValue;

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
  final double _stepHeight = 40;
  final int _stepsVisible = 5;

  TimePicker({this.initialValue});

  TimePickerState createState() => TimePickerState();
}

class TimePickerState extends State<TimePicker> {
  TimeOfDay selectedTime;
  ScrollController hoursScrollController;
  ScrollController minutesScrollController;
  ClockType clockType;

  void initState() {
    super.initState();
    selectedTime = widget.initialValue ?? TimeOfDay.now();

    if (selectedTime.hour > 11)
      clockType = ClockType.pm;
    else
      clockType = ClockType.am;

    hoursScrollController = ScrollController(
      initialScrollOffset:
          widget._hoursList.indexOf(selectedTime.hour) * widget._stepHeight,
    );

    minutesScrollController = ScrollController(
      initialScrollOffset:
          widget._minutesList.indexOf(selectedTime.minute) * widget._stepHeight,
    );
  }

  void _updateClockType() {
    Haptic.triggerWith(HapticOption.click);

    if (clockType == ClockType.am)
      setState(() {
        clockType = ClockType.pm;
      });
    else if (clockType == ClockType.pm)
      setState(() {
        clockType = ClockType.am;
      });

    _onHoursScroll();
  }

  int _getSelectedValue({double scrollOffset, List list}) {
    for (var i = 0; i < list.length; i++) {
      if (((widget._stepHeight * i - widget._stepHeight * .5) - scrollOffset)
              .abs() <
          widget._stepHeight) return list[i];
    }
    return null;
  }

  void snapScroll({ScrollController controller, List list}) {
    double animateTo;

    if (controller.offset % widget._stepHeight == 0) return;

    for (var i = 0; i < list.length; i++) {
      var distanceFromMiddle =
          ((widget._stepHeight * i + widget._stepHeight * .5) -
                  controller.offset)
              .abs();
      if (distanceFromMiddle < widget._stepHeight)
        animateTo = widget._stepHeight * i;
    }

    Future.delayed(
      Duration(milliseconds: 0),
      () => controller.animateTo(
            animateTo,
            duration: RoofDuration.short,
            curve: RoofCurve.slow,
          ),
    );
  }

  void _onHoursScroll() {
    int selectedHour = _getSelectedValue(
      scrollOffset: hoursScrollController.offset,
      list: widget._hoursList,
    );

    if (clockType == ClockType.pm) selectedHour += 12;

    if (selectedHour != selectedTime.hour) {
      Haptic.triggerWith(HapticOption.click);
      setState(() {
        selectedTime = TimeOfDay(
          hour: selectedHour,
          minute: selectedTime.minute,
        );
      });
    }
  }

  void _onMinutesScroll() {
    int selectedMinute = _getSelectedValue(
      scrollOffset: minutesScrollController.offset,
      list: widget._minutesList,
    );

    if (selectedMinute != selectedTime.minute) {
      Haptic.triggerWith(HapticOption.click);
      setState(() {
        selectedTime = TimeOfDay(
          hour: selectedTime.hour,
          minute: selectedMinute,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final paddingSteps = (widget._stepsVisible - 1) / 2;
    final padding = EdgeInsets.symmetric(
      vertical: paddingSteps * widget._stepHeight,
    );

    final columnWidth = widget._stepHeight * 1.5;

    final Widget hoursColumn = Container(
      width: columnWidth,
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollEndNotification) {
            snapScroll(
              controller: hoursScrollController,
              list: widget._hoursList,
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
              height: widget._stepHeight,
              list: widget._hoursList,
              stepsVisible: widget._stepsVisible,
              clockType: clockType,
            )
          ],
        ),
      ),
    );

    final timeDividerTextStyle = RoofTypography.bodyPrimary.textStyleWithColor(
      RoofTheme.of(context).color.text.secondary,
    );
    final Widget timeDivider = Container(
      height: widget._stepHeight,
      child: Center(
        child: Text(
          ":",
          style: timeDividerTextStyle,
        ),
      ),
    );

    final Widget minutesColumn = Container(
      width: columnWidth,
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollEndNotification) {
            snapScroll(
              controller: minutesScrollController,
              list: widget._minutesList,
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
              height: widget._stepHeight,
              list: widget._minutesList,
              stepsVisible: widget._stepsVisible,
            ),
          ],
        ),
      ),
    );

    final clockTypeTextStyle =
        RoofTypography.bodyPrimaryThick.textStyleWithColor(
      RoofTheme.of(context).color.text.secondary,
    );
    final clockTypeBox = GestureDetector(
      onTap: _updateClockType,
      child: Container(
        height: widget._stepsVisible * widget._stepHeight,
        color: RoofTheme.of(context).color.background.general,
        child: Center(
            child: Text(
          clockType == ClockType.am ? "am" : "pm",
          style: clockTypeTextStyle,
        )),
      ),
    );

    return Container(
      height: widget._stepsVisible * widget._stepHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          hoursColumn,
          timeDivider,
          minutesColumn,
          clockTypeBox,
        ],
      ),
    );
  }
}

class _RollerColumn extends StatelessWidget {
  final int selectedValue;
  final double height;
  final List<int> list;
  final int stepsVisible;
  final ClockType clockType;

  _RollerColumn({
    @required this.selectedValue,
    @required this.height,
    @required this.list,
    @required this.stepsVisible,
    this.clockType,
  }) : assert(stepsVisible.isOdd);

  final _inactiveTypography = RoofTypography.bodyPrimary;
  final _activeTypography = RoofTypography.bodyPrimaryThick;

  @override
  Widget build(BuildContext context) {
    final textColor = RoofTheme.of(context).color.text.primary;
    final inactiveStyle = _inactiveTypography.textStyleWithColor(textColor);
    final activeStyle = _activeTypography.textStyleWithColor(textColor);

    List<Widget> widgets = [];

    for (var i = 0; i < list.length; i++) {
      final text = clockType != null
          ? (list[i] + 1).toString()
          : (list[i]).toString().padLeft(2, "0");

      final adjustedValue =
          clockType == ClockType.pm ? selectedValue - 12 : selectedValue;

      widgets.add(
        Container(
          height: height,
          width: height,
          child: Center(
            child: Text(
              text,
              style: i == list.indexOf(adjustedValue)
                  ? activeStyle
                  : inactiveStyle,
            ),
          ),
        ),
      );
    }

    final columnSteps = list.length;

    return Container(
      height: columnSteps * height,
      child: Column(
        children: widgets,
      ),
    );
  }
}

enum ClockType { am, pm }
