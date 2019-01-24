import 'package:flutter/material.dart';
import 'package:spec/corner_radius.dart';
import 'package:spec/distance.dart';
import 'package:spec/color.dart';
import 'package:spec/device_haptic.dart';

import 'package:spec/bottom_sheet/bottom_sheet_route.dart';

class RoofBottomSheet extends StatelessWidget {
  final List<Widget> content;

  RoofBottomSheet(this.content);

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

    void _tapScrim(context) {
      Navigator.pop(context);
      VibrateDevice.mediumImpact();
    }

    return GestureDetector(
        onTap: () => _tapScrim(context),
        child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () => Navigator.of(context)
                        .push(BottomSheetOverlay(isFirstOverlay: false)),
                    onVerticalDragStart: (details) => _startDrag(details),
                    onVerticalDragUpdate: (details) =>
                        _monitorDragDown(details),
                    behavior: HitTestBehavior.deferToChild,
                    child: Container(
                      margin: EdgeInsets.all(RoofDistance.b),
                      decoration: BoxDecoration(
                          color: RoofColor.neutralColorA,
                          borderRadius:
                              BorderRadius.all(RoofCornerRadius.large),
                          boxShadow: [
                            BoxShadow(
                                color: RoofColor.neutralColorG,
                                blurRadius: 12,
                                offset: Offset(0, 4))
                          ]),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: 300, minWidth: double.infinity),
                        // child: RoofBottomSheetContent()
                      ),
                      // child: Container()
                    ))
              ],
            )));
  }
}
