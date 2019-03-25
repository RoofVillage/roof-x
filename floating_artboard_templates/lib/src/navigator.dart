import 'dart:async';

import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:spec/index.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:navigation_components/index.dart';
import 'package:icon_library/index.dart';
import 'package:artboard/index.dart';
import 'package:keyboard_accessory/index.dart';

import '_floating_artboard_panel.dart';

final _slideDuration = RoofDuration.medium;
final _slideCurve = RoofCurve.easy;

class FloatingArtboardNavigator extends ArtboardNavigator {
  FloatingArtboardNavigator({FloatingArtboard artboard})
      : super(child: artboard);

  @override
  State<StatefulWidget> createState() => FloatingArtboardNavigatorState();

  static FloatingInheritedArtboardNavigator of(BuildContext context) {
    return context
        .inheritFromWidgetOfExactType(FloatingInheritedArtboardNavigator);
  }
}

class FloatingArtboardNavigatorState extends ArtboardNavigatorState {
  List<FloatingArtboardNavigatorPanel> _floatingArtboardPanels = [];

  @override
  void initState() {
    final initialPanel = _buildPanelForArtboard(this.widget.child);
    _floatingArtboardPanels.add(initialPanel);
    super.initState();
  }

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

  void showNavButtons(BuildContext context) {
    setState(() {
      FloatingArtboardNavigatorPanel.of(context)
          .toggleNavButtonVisibilityTo(true);
    });
  }

  void hideNavButtons(BuildContext context) {
    setState(() {
      FloatingArtboardNavigatorPanel.of(context)
          .toggleNavButtonVisibilityTo(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageView = PageView(
        controller: _pageController,
        children: _floatingArtboardPanels,
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

    final scaffold = Scaffold(
        body: KeyboardAccessory(child: swippablePage),
        backgroundColor: Colors.transparent);

    return FloatingInheritedArtboardNavigator(
        data: this, child: RoofTheme(theme.current, child: scaffold));
  }

  @override
  Future goTo(Artboard artboard, {BuildContext context}) async {
    if (artboard is FloatingArtboard) {
      setState(() {
        final panel = _buildPanelForArtboard(artboard);
        _floatingArtboardPanels.add(panel);
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

  FloatingArtboardNavigatorPanel _buildPanelForArtboard(
      FloatingArtboard artboard) {
    final artboardIsFirst = _floatingArtboardPanels.isEmpty ||
        artboard == _floatingArtboardPanels.first.artboard;
    final button = artboard.allowsBackNavigation && !artboardIsFirst
        ? RoofTransitionIconNavButton(
            iconReference: IconReference.backArrowNav,
            onTap: (context) {
              _pageController.previousPage(
                  duration: _slideDuration, curve: _slideCurve);
              setState(() {
                _floatingArtboardPanels.removeLast();
              });
            })
        : null;

    final page =
        FloatingArtboardNavigatorPanel(artboard: artboard, navButton: button);

    return page;
  }
}

class FloatingInheritedArtboardNavigator extends InheritedArtboardNavigator {
  final BuildContextPasser hideNavButtons;
  final BuildContextPasser showNavButtons;

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
