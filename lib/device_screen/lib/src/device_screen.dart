import 'package:flutter/material.dart';

enum DeviceScreenOption { small, medium, large }

class DeviceScreen extends StatefulWidget {
  final Widget child;
  final int mediumMinWidth;
  final int largeMinWidth;

  DeviceScreen(
      {@required this.child,
      this.mediumMinWidth = 500,
      this.largeMinWidth = 1000});

  static InheritedDeviceScreen of(BuildContext context,
      {bool shouldRebuild = true}) {
    final inheritedWidget = (shouldRebuild
        ? context.inheritFromWidgetOfExactType(_InheritedDeviceScreen)
        : context.ancestorWidgetOfExactType(_InheritedDeviceScreen));

    return (inheritedWidget as _InheritedDeviceScreen).data;
  }

  @override
  State<StatefulWidget> createState() => InheritedDeviceScreen();
}

class InheritedDeviceScreen extends State<DeviceScreen> {
  DeviceScreenOption _current;
  DeviceScreenOption get current => _current;

  DeviceScreenOption _deviceScreenOf(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    if (width > widget.largeMinWidth) return DeviceScreenOption.large;
    if (width > widget.mediumMinWidth) return DeviceScreenOption.medium;
    return DeviceScreenOption.small;
  }

  @override
  Widget build(BuildContext context) {
    final deviceScreen = _deviceScreenOf(context);
    _current = deviceScreen;
    return _InheritedDeviceScreen(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedDeviceScreen extends InheritedWidget {
  final InheritedDeviceScreen data;

  _InheritedDeviceScreen({@required this.data, @required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(_InheritedDeviceScreen old) => true;
}
