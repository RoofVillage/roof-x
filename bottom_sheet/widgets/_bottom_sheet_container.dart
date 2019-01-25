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
    int initialDragTimeStamp;
    int currentDragTimeStamp;
    int timeDelta;
    double initialPositionY;
    double currentPositionY;
    double positionYDelta;

    void _startDrag(details) {
      initialDragTimeStamp = details.sourceTimeStamp.inMilliseconds;
      initialPositionY = details.globalPosition.dy;
    }

    void _monitorDragDown(details) {
      currentDragTimeStamp = details.sourceTimeStamp.inMilliseconds;
      timeDelta = currentDragTimeStamp - initialDragTimeStamp;
      currentPositionY = details.globalPosition.dy;

      positionYDelta = currentPositionY - initialPositionY;

      if (timeDelta < 70 && positionYDelta > 50) Navigator.pop(context);
    }

    return GestureDetector(
        // onTap: () => Navigator.of(context)
        //     .push(BottomSheetOverlay(isFirstOverlay: false)),
        onVerticalDragStart: (details) => _startDrag(details),
        onVerticalDragUpdate: (details) => _monitorDragDown(details),
        behavior: HitTestBehavior.deferToChild,
        child: Container(
          margin: EdgeInsets.all(RoofDistance.b),
          decoration: BoxDecoration(
              color: RoofColor.neutralColorA,
              borderRadius: BorderRadius.all(RoofCornerRadius.large),
              boxShadow: [
                BoxShadow(
                    color: RoofColor.neutralColorG,
                    blurRadius: 12,
                    offset: Offset(0, 4))
              ]),
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: 300, minWidth: double.infinity),
            // child: bottom sheet content
          ),
        ));
  }
}
