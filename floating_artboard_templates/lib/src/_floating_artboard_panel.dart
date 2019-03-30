import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:navigation_components/index.dart';
import 'package:icon_library/index.dart';

import 'floating_artboard_button_option.dart';

class FloatingArtboardNavigatorPanel extends StatefulWidget {
  final FloatingArtboard artboard;
  final FloatingArtboardButtonOption defaultNavButtonOption;

  FloatingArtboardNavigatorPanel({
    this.artboard,
    FloatingArtboardButtonOption defaultNavButtonOption,
  }) : this.defaultNavButtonOption =
            defaultNavButtonOption ?? FloatingArtboardButtonOption.close;

  @override
  State<StatefulWidget> createState() => FloatingArtboardNavigatorPanelState();

  static InheritedFloatingArtboardNavigatorPanel of(BuildContext context) {
    return context
        .inheritFromWidgetOfExactType(InheritedFloatingArtboardNavigatorPanel);
  }
}

// https://docs.flutter.io/flutter/widgets/AutomaticKeepAliveClientMixin-mixin.html
// https://github.com/flutter/flutter/issues/13080#issuecomment-399320752
class FloatingArtboardNavigatorPanelState
    extends State<FloatingArtboardNavigatorPanel>
    with AutomaticKeepAliveClientMixin {
  bool showsNavButton = true;

  // @override
  bool get wantKeepAlive => _wantKeepAlive;

  bool _wantKeepAlive = true;
  final _buttonMarginBottom = RoofDistance.d;

  RoofNavButton _navButton() {
    final buttonOption =
        widget.artboard.navButtonOption ?? widget.defaultNavButtonOption;
    switch (buttonOption) {
      case FloatingArtboardButtonOption.close:
        return RoofTransitionIconNavButton(
            iconReference: IconReference.downArrowNav,
            onTap: (context) {
              FloatingArtboardNavigator.of(context).pop(context);
            });
      case FloatingArtboardButtonOption.previous:
        return RoofTransitionIconNavButton(
            iconReference: IconReference.backArrowNav,
            onTap: (context) async {
              widget.artboard.didComplete();
              FloatingArtboardNavigator.of(context).back();
            });
    }
    return null;
  }

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
    return InheritedFloatingArtboardNavigatorPanel(data: this, child: child);
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
}

typedef ToggleNavButtonVisibility = Function(bool shouldShow);

class InheritedFloatingArtboardNavigatorPanel extends InheritedWidget {
  final ToggleNavButtonVisibility toggleNavButtonVisibilityTo;

  InheritedFloatingArtboardNavigatorPanel(
      {@required FloatingArtboardNavigatorPanelState data,
      @required Widget child})
      : toggleNavButtonVisibilityTo = data.toggleNavButtonVisibilityTo,
        super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
