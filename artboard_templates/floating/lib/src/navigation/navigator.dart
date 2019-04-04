import 'dart:async';

import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:spec/index.dart';
import 'package:artboard/index.dart';
import 'package:navigation/index.dart';
import 'package:keyboard_accessory/index.dart';

import 'panel.dart';
import 'button_option.dart';
import '../floating_artboard.dart';

final _slideDuration = RoofDuration.medium;
final _slideCurve = RoofCurve.easy;

class FloatingArtboardNavigator extends StatefulWidget {
  final Artboard artboard;

  FloatingArtboardNavigator({this.artboard});

  @override
  State<StatefulWidget> createState() => FloatingInheritedArtboardNavigator();

  static FloatingInheritedArtboardNavigator of(BuildContext context,
      {bool shouldRebuild = false}) {
    final inheritedWidget = (shouldRebuild
        ? context
            .inheritFromWidgetOfExactType(_FloatingInheritedArtboardNavigator)
        : context
            .ancestorWidgetOfExactType(_FloatingInheritedArtboardNavigator));

    return (inheritedWidget as _FloatingInheritedArtboardNavigator).data;
  }
}

class FloatingInheritedArtboardNavigator
    extends State<FloatingArtboardNavigator> {
  List<FloatingArtboardNavigatorPanel> _floatingArtboardPanels = [];

  final _pageController = PageController();

  @override
  void initState() {
    final initialPanel = _buildPanelForArtboard(this.widget.artboard);
    _floatingArtboardPanels.add(initialPanel);
    super.initState();
  }

  final _popMinDragDistanceDelta = 50;
  final _popMaxDragTimeDelta = 70;

  int _initialDragTime;
  double _initialDragDy;

  int _timeDelta;
  double _downDistanceDelta;

  get _shouldPop =>
      _timeDelta < _popMinDragDistanceDelta &&
      _downDistanceDelta > _popMaxDragTimeDelta;

  void toggleNavButtonsHidden(bool isHidden) {
    setState(() {
      FloatingArtboardNavigatorPanel.of(context)
          .toggleNavButtonVisibilityTo(!isHidden);
    });
  }

  get childrenDelegate => SliverChildBuilderDelegate((context, position) {
        if (position >= _floatingArtboardPanels.length) return Container();
        return _floatingArtboardPanels[position];
      });

  @override
  Widget build(BuildContext context) {
    final pageView = PageView.custom(
      childrenDelegate: childrenDelegate,
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
    );

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
      child: pageView,
    );

    final navigator = ArtboardNavigator(
      child: swippablePage,
      goTo: _goTo,
      pop: _pop,
      toggleNavButtonsHidden: (isHidden) {
        FloatingArtboardNavigator.of(context).toggleNavButtonsHidden(isHidden);
      },
    );
    final scaffold = Scaffold(
      body: KeyboardAccessory(child: navigator),
      backgroundColor: Colors.transparent,
    );

    return _FloatingInheritedArtboardNavigator(
      data: this,
      child: RoofTheme(theme.current, child: scaffold),
    );
  }

  Future<T> _goTo<T>(Artboard<T> artboard,
      {@required BuildContext context}) async {
    if (artboard is FloatingArtboard) {
      final panel = _buildPanelForArtboard<T>(artboard);
      setState(() => _floatingArtboardPanels.add(panel));
      _pageController.nextPage(duration: _slideDuration, curve: _slideCurve);
    } else {
      Navigator.pop(context, artboard);
    }
    return artboard.popped;
  }

  bool _pop<T>([T result]) {
    widget.artboard.didComplete();
    return Navigator.pop(context, result);
  }

  void _onVerticalDragStart(details) {
    _initialDragTime = details.sourceTimeStamp.inMilliseconds;
    _initialDragDy = details.globalPosition.dy;
  }

  void _onDragDownUpdate(details) {
    _timeDelta = details.sourceTimeStamp.inMilliseconds - _initialDragTime;
    _downDistanceDelta = details.globalPosition.dy - _initialDragDy;
  }

  void back() async {
    await _pageController.previousPage(
        duration: _slideDuration, curve: _slideCurve);
    setState(() => _floatingArtboardPanels.removeLast());
  }

  FloatingArtboardNavigatorPanel _buildPanelForArtboard<T>(
      FloatingArtboard<T> artboard) {
    final artboardIsFirst = _floatingArtboardPanels.isEmpty ||
        artboard == _floatingArtboardPanels.first.artboard;
    final defaultNavButtonOption = artboardIsFirst
        ? FloatingArtboardButtonOption.close
        : FloatingArtboardButtonOption.previous;

    final page = FloatingArtboardNavigatorPanel<T>(
      artboard: artboard,
      defaultNavButtonOption: defaultNavButtonOption,
    );

    return page;
  }
}

class _FloatingInheritedArtboardNavigator extends InheritedWidget {
  final FloatingInheritedArtboardNavigator data;

  _FloatingInheritedArtboardNavigator(
      {@required this.data, @required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(_FloatingInheritedArtboardNavigator old) => false;
}
