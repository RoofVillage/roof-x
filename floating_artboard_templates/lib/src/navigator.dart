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
}

class FloatingArtboardNavigatorState extends ArtboardNavigatorState {
  final List<Widget> _pages;

  FloatingArtboardNavigatorState({FloatingArtboard artboard})
      : _pages = [_FloatingArtboardNavigatorPanel(artboard: artboard)];

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

  @override
  Widget build(BuildContext context) {
    final pageView = PageView(
        controller: _pageController,
        children: _pages,
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

    return InheritedArtboardNavigator(
        data: this, child: RoofTheme(theme.current, child: scaffold));
  }

  @override
  Future goTo(Artboard artboard, {BuildContext context}) async {
    if (artboard is FloatingArtboard) {
      final button = artboard.allowsBackNavigation
          ? RoofTransitionIconNavButton(
              iconReference: IconReference.backArrowNav,
              onTap: (context) {
                _pageController.previousPage(
                    duration: _slideDuration, curve: _slideCurve);
                setState(() {
                  _pages.removeLast();
                });
              })
          : null;

      final page = _FloatingArtboardNavigatorPanel(
          artboard: artboard, navButton: button);

      setState(() {
        _pages.add(page);
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
}

class _FloatingArtboardNavigatorPanel extends StatefulWidget {
  final FloatingArtboard artboard;
  final RoofTransitionIconNavButton navButton;

  final _defaultNavButton = RoofTransitionIconNavButton(
      iconReference: IconReference.downArrowNav, onTap: ArtboardNavigator.pop);

  _FloatingArtboardNavigatorPanel({this.artboard, this.navButton});

  @override
  State<StatefulWidget> createState() => _FloatingArtboardNavigatorPanelState();
}

// https://docs.flutter.io/flutter/widgets/AutomaticKeepAliveClientMixin-mixin.html
// https://github.com/flutter/flutter/issues/13080#issuecomment-399320752
class _FloatingArtboardNavigatorPanelState
    extends State<_FloatingArtboardNavigatorPanel>
    with AutomaticKeepAliveClientMixin {
  final _buttonMarginBottom = RoofDistance.e;

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
    double height = MediaQuery.of(context).size.height;
    double ratio = (height - _buttonMarginBottom) / height;

    final _alignment = Alignment(0, ratio);

    return Stack(alignment: _alignment, children: [
      flexibleColumn,
      widget.navButton ?? widget._defaultNavButton
    ]);
  }

  @override
  bool get wantKeepAlive => true;
}
