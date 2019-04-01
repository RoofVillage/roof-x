import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:icon_library/index.dart';
import 'package:nav_button_builder/index.dart';

import '../floating_artboard_button_option.dart';

class FloatingArtboardNavigatorPanel<T> extends StatefulWidget {
  final FloatingArtboard artboard;
  final FloatingArtboardButtonOption defaultNavButtonOption;

  FloatingArtboardNavigatorPanel({
    this.artboard,
    @required this.defaultNavButtonOption,
  });

  @override
  State<StatefulWidget> createState() =>
      InheritedFloatingArtboardNavigatorPanel<T>();

  static InheritedFloatingArtboardNavigatorPanel of(BuildContext context,
      {bool shouldRebuild = true}) {
    final inheritedWidget = (shouldRebuild
        ? context.inheritFromWidgetOfExactType(
            _InheritedFloatingArtboardNavigatorPanel)
        : context.ancestorWidgetOfExactType(
            _InheritedFloatingArtboardNavigatorPanel));

    return (inheritedWidget as _InheritedFloatingArtboardNavigatorPanel).data;
  }
}

// https://docs.flutter.io/flutter/widgets/AutomaticKeepAliveClientMixin-mixin.html
// https://github.com/flutter/flutter/issues/13080#issuecomment-399320752
class InheritedFloatingArtboardNavigatorPanel<T>
    extends State<FloatingArtboardNavigatorPanel<T>>
    with AutomaticKeepAliveClientMixin, IconNavButtonBuilder {
  bool showsNavButton = true;

  bool _wantKeepAlive = true;
  final _buttonMarginBottom = RoofDistance.d;
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
    if (showsNavButton) {
      final button = _navButton();
      children.add(button);
    }

    final child = Stack(alignment: _alignment, children: children);
    return _InheritedFloatingArtboardNavigatorPanel(data: this, child: child);
  }

  @override
  void dispose() {
    _wantKeepAlive = false;
    updateKeepAlive();
    super.dispose();
  }

  void toggleNavButtonVisibilityTo(bool shouldShow) {
    setState(() => showsNavButton = shouldShow);
  }

  Widget _navButton() {
    final buttonOption =
        widget.artboard.navButtonOption ?? widget.defaultNavButtonOption;
    switch (buttonOption) {
      case FloatingArtboardButtonOption.close:
        return buildIconNavButton(context,
            iconReference: IconReference.downArrowNav, onTap: (context) {
          ArtboardNavigator.of(context).pop(_result);
        });
      case FloatingArtboardButtonOption.previous:
        return buildIconNavButton(context,
            iconReference: IconReference.backArrowNav, onTap: (context) {
          widget.artboard.didComplete(_result);
          FloatingArtboardNavigator.of(context, shouldRebuild: false).back();
        });
    }

    return null;
  }
}

class _InheritedFloatingArtboardNavigatorPanel extends InheritedWidget {
  final InheritedFloatingArtboardNavigatorPanel data;

  _InheritedFloatingArtboardNavigatorPanel(
      {@required this.data, @required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(_InheritedFloatingArtboardNavigatorPanel old) => true;
}
