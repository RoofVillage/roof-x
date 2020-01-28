import 'package:flutter/material.dart';

import 'horizontal_floating_artboard.dart';

class HorizontalFloatingArtboardNavigatorPanel<T> extends StatefulWidget {
  final HorizontalFloatingArtboard artboard;

  HorizontalFloatingArtboardNavigatorPanel({this.artboard});

  @override
  State<StatefulWidget> createState() =>
      InheritedHorizontalFloatingArtboardNavigatorPanel<T>();

  static InheritedHorizontalFloatingArtboardNavigatorPanel of(
    BuildContext context, {
    bool shouldRebuild = true,
  }) {
    final inheritedWidget = shouldRebuild
        ? context.dependOnInheritedWidgetOfExactType<
            _InheritedHorizontalFloatingArtboardNavigatorPanel>()
        : context.findAncestorWidgetOfExactType<
            _InheritedHorizontalFloatingArtboardNavigatorPanel>();

    return inheritedWidget.data;
  }
}

// https://docs.flutter.io/flutter/widgets/AutomaticKeepAliveClientMixin-mixin.html
// https://github.com/flutter/flutter/issues/13080#issuecomment-399320752
class InheritedHorizontalFloatingArtboardNavigatorPanel<T>
    extends State<HorizontalFloatingArtboardNavigatorPanel<T>>
    with AutomaticKeepAliveClientMixin {
  bool _wantKeepAlive = true;
  T _result;

  set result(T value) => setState(() => _result = value);
  get result => _result;

  @override
  bool get wantKeepAlive => _wantKeepAlive;

  @override
  Widget build(BuildContext context) {
    super.build(context); //necessary for the mixin.

    final child = Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [widget.artboard],
    );

    return _InheritedHorizontalFloatingArtboardNavigatorPanel(
      data: this,
      child: child,
    );
  }

  @override
  void dispose() {
    _wantKeepAlive = false;
    updateKeepAlive();
    super.dispose();
  }
}

class _InheritedHorizontalFloatingArtboardNavigatorPanel
    extends InheritedWidget {
  final InheritedHorizontalFloatingArtboardNavigatorPanel data;

  _InheritedHorizontalFloatingArtboardNavigatorPanel({
    @required this.data,
    @required Widget child,
  }) : super(
          child: child,
        );

  @override
  bool updateShouldNotify(
          _InheritedHorizontalFloatingArtboardNavigatorPanel old) =>
      true;
}
