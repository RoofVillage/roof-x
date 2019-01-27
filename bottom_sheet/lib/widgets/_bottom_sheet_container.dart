import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:spec/haptics/index.dart';
import 'package:spec/theme/index.dart';

class RoofBottomSheetContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _closeBottomSheet(context) {
      Navigator.pop(context);
      RoofHaptic.triggerWith(RoofHapticOption.medium);
    }

    return GestureDetector(
        onTap: () => _closeBottomSheet(context),
        child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [_RoofBottomSheetContentArea()],
            )));
  }
}

class _RoofBottomSheetContentArea extends StatelessWidget {
  final double _minDragDelta = 50;
  final double _maxTimeDelta = 70;

  @override
  Widget build(BuildContext context) {
    int _initialDragTimeStamp;
    int _currentDragTimeStamp;
    int _timeDelta;
    double _initialPositionY;
    double _currentPositionY;
    double _positionYDelta;

    bool _shouldPop() {
      return _timeDelta < _maxTimeDelta && _positionYDelta > _minDragDelta;
    }

    void _startDrag(details) {
      _initialDragTimeStamp = details.sourceTimeStamp.inMilliseconds;
      _initialPositionY = details.globalPosition.dy;
    }

    void _monitorDragDown(details) {
      _currentDragTimeStamp = details.sourceTimeStamp.inMilliseconds;
      _timeDelta = _currentDragTimeStamp - _initialDragTimeStamp;
      _currentPositionY = details.globalPosition.dy;

      _positionYDelta = _currentPositionY - _initialPositionY;
    }

    final bottomSheetMargin = EdgeInsets.all(RoofDistance.b);
    final generalBackgroundColor =
        RoofTheme.of(context).color.background.general;

    final bottomSheetDecoration = BoxDecoration(
        color: generalBackgroundColor,
        borderRadius: BorderRadius.all(RoofCornerRadius.large),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 12, offset: Offset(0, 4))
        ]);

    final sizeConstraints =
        BoxConstraints(minHeight: 300, minWidth: double.infinity);

    return GestureDetector(
        onVerticalDragStart: _startDrag,
        onVerticalDragUpdate: (details) {
          _monitorDragDown(details);
          if (_shouldPop()) Navigator.pop(context);
        },
        behavior: HitTestBehavior.deferToChild,
        child: Container(
            margin: bottomSheetMargin,
            decoration: bottomSheetDecoration,
            child: ConstrainedBox(
              constraints: sizeConstraints,
              // child: child will go here
            )));
  }
}
