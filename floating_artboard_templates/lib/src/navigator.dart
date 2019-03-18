import 'dart:async';

import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:spec/index.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:navigation_components/index.dart';
import 'package:icon_library/index.dart';
import 'package:artboard/index.dart';

final _slideDuration = RoofDuration.medium;
final _slideCurve = RoofCurve.easy;

class FloatingArtboardNavigator extends ArtboardNavigator {
  final FloatingArtboard _artboard;

  FloatingArtboardNavigator({FloatingArtboard artboard}) : _artboard = artboard;

  @override
  State<StatefulWidget> createState() =>
      FloatingArtboardNavigatorState(artboard: _artboard);

  static FloatingInheritedArtboardNavigator of(BuildContext context) {
    return context
        .inheritFromWidgetOfExactType(FloatingInheritedArtboardNavigator);
  }
}

class FloatingArtboardNavigatorState extends ArtboardNavigatorState {
  final List<FloatingArtboard> _floatingArtboards;

  FloatingArtboardNavigatorState({FloatingArtboard artboard})
      : _floatingArtboards = [artboard];

  final _popMinDragDistanceDelta = 50;
  final _popMaxDragTimeDelta = 70;
  final _pageController = PageController(keepPage: true);

  int _initialDragTime;
  double _initialDragDy;

  int _timeDelta;
  double _downDistanceDelta;

  get _shouldPop =>
      _timeDelta < _popMinDragDistanceDelta &&
      _downDistanceDelta > _popMaxDragTimeDelta;

  bool showsNavButtons = true;

  void showNavButtons() {
    setState(() {
      showsNavButtons = true;
    });
  }

  void hideNavButtons() {
    setState(() {
      showsNavButtons = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageView = PageView(
        controller: _pageController,
        children: _buildPanels(),
        physics: NeverScrollableScrollPhysics());

    final theme = RoofTheme.of(context);
    final swippablePage = GestureDetector(
        onTap: (() => Navigator.pop(context)),
        onVerticalDragStart: _onVerticalDragStart,
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta < 0) return;
          _onDragDownUpdate(details);
          if (_shouldPop) Navigator.pop(context);
        },
        behavior: HitTestBehavior.opaque,
        child: pageView);

    final scaffold =
        Scaffold(body: swippablePage, backgroundColor: Colors.transparent);

    return FloatingInheritedArtboardNavigator(
        data: this, child: RoofTheme(theme.current, child: scaffold));
  }

  @override
  Future goTo(Artboard artboard, {BuildContext context}) async {
    if (artboard is FloatingArtboard) {
      setState(() {
        _floatingArtboards.add(artboard);
      });
      _pageController.nextPage(duration: _slideDuration, curve: _slideCurve);
    } else {
      Navigator.pop(context, artboard);
    }
  }

  void _onVerticalDragStart(details) {
    _initialDragTime = details.sourceTimeStamp.inMilliseconds;
    _initialDragDy = details.globalPosition.dy;
  }

  void _onDragDownUpdate(details) {
    _timeDelta = details.sourceTimeStamp.inMilliseconds - _initialDragTime;
    _downDistanceDelta = details.globalPosition.dy - _initialDragDy;
  }

  List<_FloatingArtboardNavigatorPanel> _buildPanels() {
    return _floatingArtboards.map((artboard) {
      final button =
          artboard.allowsBackNavigation && artboard != _floatingArtboards.first
              ? RoofTransitionIconNavButton(
                  iconReference: IconReference.backArrowNav,
                  onTap: (context) {
                    _pageController.previousPage(
                        duration: _slideDuration, curve: _slideCurve);
                    setState(() {
                      _floatingArtboards.removeLast();
                    });
                  })
              : null;

      final page = _FloatingArtboardNavigatorPanel(
          artboard: artboard,
          navButton: button,
          showsNavButton: showsNavButtons);

      return page;
    }).toList();
  }
}

class FloatingInheritedArtboardNavigator extends InheritedArtboardNavigator {
  final Function hideNavButtons;
  final Function showNavButtons;

  FloatingInheritedArtboardNavigator(
      {Key key,
      @required FloatingArtboardNavigatorState data,
      @required Widget child})
      : hideNavButtons = data.hideNavButtons,
        showNavButtons = data.showNavButtons,
        super(key: key, data: data, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

class _FloatingArtboardNavigatorPanel extends StatefulWidget {
  static final _defaultNavButton = RoofTransitionIconNavButton(
      iconReference: IconReference.downArrowNav, onTap: ArtboardNavigator.pop);

  final FloatingArtboard artboard;
  final RoofTransitionIconNavButton navButton;
  final bool showsNavButton;

  _FloatingArtboardNavigatorPanel(
      {this.artboard,
      bool showsNavButton,
      RoofTransitionIconNavButton navButton})
      : this.showsNavButton = showsNavButton ?? true,
        this.navButton = navButton ?? _defaultNavButton;

  @override
  State<StatefulWidget> createState() => _FloatingArtboardNavigatorPanelState();
}

// https://docs.flutter.io/flutter/widgets/AutomaticKeepAliveClientMixin-mixin.html
// https://github.com/flutter/flutter/issues/13080#issuecomment-399320752
class _FloatingArtboardNavigatorPanelState
    extends State<_FloatingArtboardNavigatorPanel>
    with AutomaticKeepAliveClientMixin {
  final _buttonMarginBottom = RoofDistance.d;

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
    if (widget.showsNavButton) {
      children.add(widget.navButton);
    }

    return Stack(alignment: _alignment, children: children);
  }

  @override
  bool get wantKeepAlive => true;
}
