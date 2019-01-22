import 'package:flutter/material.dart';
import 'package:spec/distance.dart';

class RoofAnimatedSwitch extends StatelessWidget {
  final bool value;
  final Color color;

  RoofAnimatedSwitch({this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 52,
        height: 34,
        margin: EdgeInsets.fromLTRB(RoofDistance.d, 0, 0, 0),
        decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.all(Radius.circular(17))),
        child: Padding(
            padding: EdgeInsets.all(4.0),
            child: AnimatedAlign(
                child: Container(
                  width: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: color,
                  ),
                ),
                alignment: value ? Alignment(1.0, 0.0) : Alignment(-1.0, 0.0),
                curve: Curves.easeIn,
                duration: Duration(milliseconds: 180))));
  }
}
