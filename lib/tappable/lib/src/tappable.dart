import 'package:flutter/material.dart';

/// Building a widget with `buildTappedAwareGestureDetector()` enables use of class-scoped singleton `tapped` variable, which is set to true on `onTapDown`, and to false on `onTapUp`.
mixin Tappable<T extends StatefulWidget> on State<T> {
  /// `minTapDuration` adds a slight delay to allow enough time for stateful effects that depend on `tapped`. Override to `null` to remove delay.
  Duration get minTapDuration => Duration(milliseconds: 40);

  bool tapped = false;

  setTapped(bool val) async {
    if (val == false && minTapDuration != null) {
      await Future.delayed(minTapDuration);
    }
    setState(() {
      tapped = val;
    });
  }

  _onTap(void Function() onTap) async {
    if (minTapDuration != null) await Future.delayed(minTapDuration);
    onTap();
  }

  GestureDetector buildTappedAwareGestureDetector({
    Widget child,
    void Function() onTap,
  }) {
    return GestureDetector(
      onTapDown: (_) => setTapped(true),
      onTapUp: (_) => setTapped(false),
      onTapCancel: () => setTapped(false),
      onTap: () => _onTap(onTap),
      child: child,
    );
  }
}
