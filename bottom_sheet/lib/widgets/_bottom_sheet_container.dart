import 'package:flutter/material.dart';
import 'package:spec/index.dart';

class RoofBottomSheetContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _closeBottomSheet(context) {
      Navigator.pop(context);
      VibrateDevice.mediumImpact();
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
  @override
  Widget build(BuildContext context) {
    int _initialDragTimeStamp;
    int _currentDragTimeStamp;
    int _timeDelta;
    double _initialPositionY;
    double _currentPositionY;
    double _positionYDelta;

    void _startDrag(details) {
      _initialDragTimeStamp = details.sourceTimeStamp.inMilliseconds;
      _initialPositionY = details.globalPosition.dy;
    }

    const double _minDragDelta = 50;
    const double _maxTimeDelta = 70;

    void _monitorDragDown(details) {
      _currentDragTimeStamp = details.sourceTimeStamp.inMilliseconds;
      _timeDelta = _currentDragTimeStamp - _initialDragTimeStamp;
      _currentPositionY = details.globalPosition.dy;

      _positionYDelta = _currentPositionY - _initialPositionY;

      if (_timeDelta < _maxTimeDelta && _positionYDelta > _minDragDelta)
        Navigator.pop(context);
    }

    final _bottomSheetMargin = EdgeInsets.all(RoofDistance.b);
    final _bottomSheetDecoration = BoxDecoration(
        color: RoofColor.neutralColorA,
        borderRadius: BorderRadius.all(RoofCornerRadius.large),
        boxShadow: [
          BoxShadow(
              color: RoofColor.neutralColorG,
              blurRadius: 12,
              offset: Offset(0, 4))
        ]);

    final _sizeConstraints =
        BoxConstraints(minHeight: 300, minWidth: double.infinity);

    return GestureDetector(
        onVerticalDragStart: (details) => _startDrag(details),
        onVerticalDragUpdate: (details) => _monitorDragDown(details),
        behavior: HitTestBehavior.deferToChild,
        child: Container(
            margin: _bottomSheetMargin,
            decoration: _bottomSheetDecoration,
            child: ConstrainedBox(
              constraints: _sizeConstraints,
              // child: child will go here
            )));
  }
}
