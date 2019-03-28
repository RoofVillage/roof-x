import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:navigation_components/index.dart';
import 'package:icon_library/index.dart';

class FloatingArtboardNavigatorPanel extends StatefulWidget {
  static final _defaultNavButton = RoofTransitionIconNavButton(
      iconReference: IconReference.downArrowNav,
      onTap: (context) {
        FloatingArtboardNavigator.of(context).pop(context);
      });

  final FloatingArtboard artboard;
  final RoofTransitionIconNavButton navButton;

  FloatingArtboardNavigatorPanel(
      {this.artboard, RoofTransitionIconNavButton navButton})
      : this.navButton = navButton ?? _defaultNavButton;

  @override
  State<StatefulWidget> createState() => FloatingArtboardNavigatorPanelState();

  static InheritedArtboardNavigatorPanel of(BuildContext context) {
    return context
        .inheritFromWidgetOfExactType(InheritedArtboardNavigatorPanel);
  }
}

// https://docs.flutter.io/flutter/widgets/AutomaticKeepAliveClientMixin-mixin.html
// https://github.com/flutter/flutter/issues/13080#issuecomment-399320752
class FloatingArtboardNavigatorPanelState
    extends State<FloatingArtboardNavigatorPanel>
    with AutomaticKeepAliveClientMixin {
  final _buttonMarginBottom = RoofDistance.d;

  bool showsNavButton = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
      children.add(widget.navButton);
    }

    final child = Stack(alignment: _alignment, children: children);
    return InheritedArtboardNavigatorPanel(data: this, child: child);
  }

  @override
  bool get wantKeepAlive => true;

  void toggleNavButtonVisibilityTo(bool shouldShow) {
    setState(() {
      showsNavButton = shouldShow;
    });
  }
}

typedef ToggleNavButtonVisibility = Function(bool shouldShow);

class InheritedArtboardNavigatorPanel extends InheritedWidget {
  final ToggleNavButtonVisibility toggleNavButtonVisibilityTo;

  InheritedArtboardNavigatorPanel(
      {@required FloatingArtboardNavigatorPanelState data,
      @required Widget child})
      : toggleNavButtonVisibilityTo = data.toggleNavButtonVisibilityTo,
        super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
