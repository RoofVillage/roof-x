import 'package:flutter/material.dart';

class VerticalFloatingArtboardNavigationButtonStateManager
    extends StatefulWidget {
  final Widget child;
  VerticalFloatingArtboardNavigationButtonStateManager({@required this.child});

  @override
  State<StatefulWidget> createState() =>
      InheritedVerticalFloatingArtboardNavigationButtonStateManager();

  static InheritedVerticalFloatingArtboardNavigationButtonStateManager of(
      BuildContext context,
      {bool shouldRebuild = true}) {
    final inheritedWidget = (shouldRebuild
        ? context.inheritFromWidgetOfExactType(
            _InheritedVerticalFloatingArtboardNavigationButtonStateManager)
        : context.ancestorWidgetOfExactType(
            _InheritedVerticalFloatingArtboardNavigationButtonStateManager));

    return (inheritedWidget
            as _InheritedVerticalFloatingArtboardNavigationButtonStateManager)
        .data;
  }
}

// https://docs.flutter.io/flutter/widgets/AutomaticKeepAliveClientMixin-mixin.html
// https://github.com/flutter/flutter/issues/13080#issuecomment-399320752
class InheritedVerticalFloatingArtboardNavigationButtonStateManager
    extends State<VerticalFloatingArtboardNavigationButtonStateManager> {
  bool showsNavButton = true;

  @override
  Widget build(BuildContext context) {
    return _InheritedVerticalFloatingArtboardNavigationButtonStateManager(
        data: this, child: widget.child);
  }

  void toggleNavButtonVisibilityTo(bool shouldShow) {
    if (showsNavButton == shouldShow) return;
    setState(() => showsNavButton = shouldShow);
  }
}

class _InheritedVerticalFloatingArtboardNavigationButtonStateManager
    extends InheritedWidget {
  final InheritedVerticalFloatingArtboardNavigationButtonStateManager data;

  _InheritedVerticalFloatingArtboardNavigationButtonStateManager(
      {@required this.data, @required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(
          _InheritedVerticalFloatingArtboardNavigationButtonStateManager old) =>
      true;
}
