import 'dart:async';

import 'package:flutter/material.dart';
import 'package:artboard/index.dart';
import 'package:navigator/index.dart';
import 'package:keyboard_accessory/index.dart';

import 'panel.dart';
import 'horizontal_floating_artboard.dart';

class HorizontalFloatingArtboardNavigator extends StatefulWidget {
  final Artboard artboard;

  HorizontalFloatingArtboardNavigator({this.artboard});

  @override
  State<StatefulWidget> createState() =>
      HorizontalFloatingInheritedArtboardNavigator();

  static HorizontalFloatingInheritedArtboardNavigator of(
    BuildContext context, {
    bool shouldRebuild = false,
  }) {
    final inheritedWidget = shouldRebuild
        ? context.dependOnInheritedWidgetOfExactType<
            _HorizontalFloatingInheritedArtboardNavigator>()
        : context.findAncestorWidgetOfExactType<
            _HorizontalFloatingInheritedArtboardNavigator>();

    return inheritedWidget.data;
  }
}

class HorizontalFloatingInheritedArtboardNavigator
    extends State<HorizontalFloatingArtboardNavigator> {
  List<HorizontalFloatingArtboardNavigatorPanel> _floatingArtboardPanels = [];

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
  double _initialDragDx;

  int _timeDelta;
  double _rightDistanceDelta;

  get _shouldPop =>
      _timeDelta < _popMinDragDistanceDelta &&
      _rightDistanceDelta > _popMaxDragTimeDelta;

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

    final swippablePage = GestureDetector(
      onTap: (() => Navigator.pop(context)),
      onHorizontalDragStart: _onHorizontalDragStart,
      onHorizontalDragUpdate: (details) {
        if (details.primaryDelta < 0) return;
        _onDragRightUpdate(details);
        if (_shouldPop) Navigator.pop(context);
      },
      behavior: HitTestBehavior.opaque,
      child: pageView,
    );

    final navigator = ArtboardNavigator(
      child: swippablePage,
      goTo: _goTo,
      pop: _pop,
    );

    final scaffold = Scaffold(
      body: KeyboardAccessory(child: navigator),
      backgroundColor: Colors.transparent,
    );

    return _HorizontalFloatingInheritedArtboardNavigator(
      data: this,
      child: scaffold,
    );
  }

  Future<T> _goTo<T>(Artboard<T> artboard,
      {@required BuildContext context}) async {
    if (artboard is HorizontalFloatingArtboard) {
      final panel = _buildPanelForArtboard<T>(artboard);
      final index = _floatingArtboardPanels.length;
      setState(() => _floatingArtboardPanels.add(panel));
      _pageController.jumpToPage(index);
    } else {
      Navigator.pop(context, artboard);
    }

    return artboard.popped;
  }

  bool _pop<T>([T result]) {
    widget.artboard.didComplete();
    return Navigator.pop(context, result);
  }

  void _onHorizontalDragStart(details) {
    _initialDragTime = details.sourceTimeStamp.inMilliseconds;
    _initialDragDx = details.globalPosition.dx;
  }

  void _onDragRightUpdate(details) {
    _timeDelta = details.sourceTimeStamp.inMilliseconds - _initialDragTime;
    _rightDistanceDelta = details.globalPosition.dx - _initialDragDx;
  }

  void back() async {
    final index = _floatingArtboardPanels.length - 1;
    _pageController.jumpToPage(index);
    setState(() => _floatingArtboardPanels.removeLast());
  }

  HorizontalFloatingArtboardNavigatorPanel _buildPanelForArtboard<T>(
      HorizontalFloatingArtboard<T> artboard) {
    return HorizontalFloatingArtboardNavigatorPanel<T>(artboard: artboard);
  }
}

class _HorizontalFloatingInheritedArtboardNavigator extends InheritedWidget {
  final HorizontalFloatingInheritedArtboardNavigator data;

  _HorizontalFloatingInheritedArtboardNavigator({
    @required this.data,
    @required Widget child,
  }) : super(
          child: child,
        );

  @override
  bool updateShouldNotify(_HorizontalFloatingInheritedArtboardNavigator old) =>
      false;
}
