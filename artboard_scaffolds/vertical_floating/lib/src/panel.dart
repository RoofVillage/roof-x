import 'package:flutter/material.dart';
import 'package:distance/index.dart' as distance;
import 'package:icon_library/index.dart';
import 'package:nav_button_builder/index.dart';
import 'package:navigator/index.dart';
import 'package:vertical_floating_artboard_button_option/index.dart';

import 'vertical_floating_artboard.dart';
import 'navigator.dart';

class VerticalFloatingArtboardNavigatorPanel<T> extends StatefulWidget {
  final VerticalFloatingArtboard artboard;
  final VerticalFloatingArtboardButtonOption defaultNavButtonOption;

  VerticalFloatingArtboardNavigatorPanel({
    this.artboard,
    @required this.defaultNavButtonOption,
  });

  @override
  State<StatefulWidget> createState() =>
      InheritedVerticalFloatingArtboardNavigatorPanel<T>();

  static InheritedVerticalFloatingArtboardNavigatorPanel of(
      BuildContext context,
      {bool shouldRebuild = true}) {
    final inheritedWidget = (shouldRebuild
        ? context.inheritFromWidgetOfExactType(
            _InheritedVerticalFloatingArtboardNavigatorPanel)
        : context.ancestorWidgetOfExactType(
            _InheritedVerticalFloatingArtboardNavigatorPanel));

    return (inheritedWidget as _InheritedVerticalFloatingArtboardNavigatorPanel)
        .data;
  }
}

// https://docs.flutter.io/flutter/widgets/AutomaticKeepAliveClientMixin-mixin.html
// https://github.com/flutter/flutter/issues/13080#issuecomment-399320752
class InheritedVerticalFloatingArtboardNavigatorPanel<T>
    extends State<VerticalFloatingArtboardNavigatorPanel<T>>
    with AutomaticKeepAliveClientMixin, IconNavButtonBuilder {
  bool _wantKeepAlive = true;
  final _buttonMarginBottom = distance.b;
  T _result;

  set result(T value) => setState(() => _result = value);
  get result => _result;

  @override
  bool get wantKeepAlive => _wantKeepAlive;

  @override
  Widget build(BuildContext context) {
    super.build(context); //necessary for the mixin.

    final flexibleColumn = Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(child: SingleChildScrollView(child: widget.artboard))
        ]);

    ///The percent from the bottom where the button will live;
    final halfHeight = MediaQuery.of(context).size.height * 0.5;
    final safeArea = MediaQuery.of(context).padding.bottom;

    final ratio = (halfHeight - _buttonMarginBottom - safeArea) / halfHeight;

    final _alignment = Alignment(0, ratio);

    List<Widget> children = [flexibleColumn];
    if (VerticalFloatingArtboardNavigator.of(context).showsNavButton) {
      final button = _navButton();
      children.add(button);
    }

    final child = Stack(alignment: _alignment, children: children);
    return _InheritedVerticalFloatingArtboardNavigatorPanel(
        data: this, child: child);
  }

  @override
  void dispose() {
    _wantKeepAlive = false;
    updateKeepAlive();
    super.dispose();
  }

  Widget _navButton() {
    final buttonOption =
        widget.artboard.navButtonOption ?? widget.defaultNavButtonOption;
    switch (buttonOption) {
      case VerticalFloatingArtboardButtonOption.close:
        return buildIconNavButton(context,
            iconReference: NavigationIcon.downArrow, onTap: (context) {
          ArtboardNavigator.of(context).pop(_result);
        });
      case VerticalFloatingArtboardButtonOption.previous:
        return buildIconNavButton(context,
            iconReference: NavigationIcon.backArrow, onTap: (context) {
          widget.artboard.didComplete(_result);
          VerticalFloatingArtboardNavigator.of(context, shouldRebuild: false)
              .back();
        });
    }

    return null;
  }
}

class _InheritedVerticalFloatingArtboardNavigatorPanel extends InheritedWidget {
  final InheritedVerticalFloatingArtboardNavigatorPanel data;

  _InheritedVerticalFloatingArtboardNavigatorPanel(
      {@required this.data, @required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(
          _InheritedVerticalFloatingArtboardNavigatorPanel old) =>
      true;
}
