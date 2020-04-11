import 'dart:async';

import 'package:flutter/material.dart';
import 'package:artboard/index.dart';
import 'package:navigator/index.dart';
import 'package:keyboard_accessory/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:vertical_floating_artboard_button_option/index.dart';

import 'panel.dart';
import 'vertical_floating_artboard.dart';

class VerticalFloatingArtboardNavigator extends StatefulWidget {
  final Artboard artboard;

  VerticalFloatingArtboardNavigator({
    this.artboard,
  });

  @override
  State<StatefulWidget> createState() =>
      VerticalFloatingInheritedArtboardNavigator();

  static VerticalFloatingInheritedArtboardNavigator of(
    BuildContext context, {
    bool shouldRebuild = false,
  }) {
    final inheritedWidget = shouldRebuild
        ? context.dependOnInheritedWidgetOfExactType<
            _VerticalFloatingInheritedArtboardNavigator>()
        : context.findAncestorWidgetOfExactType<
            _VerticalFloatingInheritedArtboardNavigator>();

    return inheritedWidget.data;
  }
}

class VerticalFloatingInheritedArtboardNavigator
    extends State<VerticalFloatingArtboardNavigator> {
  List<VerticalFloatingArtboardNavigatorPanel> _floatingArtboardPanels = [];

  final _pageController = PageController();
  final _popMinDragDistanceDelta = 30;
  final _popMaxDragTimeDelta = 50;

  bool showsNavButton = true;
  int _initialDragTime;
  double _initialDragDy;
  int _timeDelta;
  double _downDistanceDelta;

  @override
  void initState() {
    final initialPanel = _buildPanelForArtboard(this.widget.artboard);
    _floatingArtboardPanels.add(initialPanel);
    super.initState();
  }

  // Must drag _popMinDragDistanceDelta in less time than _popMaxDragTimeDelta to pop
  get _shouldPop =>
      _timeDelta < _popMaxDragTimeDelta &&
      _downDistanceDelta > _popMinDragDistanceDelta;

  get childrenDelegate => SliverChildBuilderDelegate((
        context,
        position,
      ) {
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
      onNavButtonVisibilityChange: toggleNavButtonsHidden,
    );

    final scaffold = Scaffold(
      body: KeyboardAccessory(child: navigator),
      backgroundColor: Colors.transparent,
    );

    return _VerticalFloatingInheritedArtboardNavigator(
      data: this,
      child: scaffold,
    );
  }

  void back(BuildContext context) async {
    final theme = SemanticTheme.of(context);

    await _pageController.previousPage(
      duration: theme.duration.medium,
      curve: theme.curve.exit,
    );
    setState(
      () => _floatingArtboardPanels.removeLast(),
    );
  }

  void toggleNavButtonVisibilityTo(bool shouldShow) {
    if (showsNavButton == shouldShow) return;
    setState(() => showsNavButton = shouldShow);
  }

  Future<T> _goTo<T>(
    Artboard<T> artboard, {
    @required BuildContext context,
  }) async {
    if (artboard is VerticalFloatingArtboard) {
      final panel = _buildPanelForArtboard<T>(artboard);

      setState(() => _floatingArtboardPanels.add(panel));

      final theme = SemanticTheme.of(context);
      _pageController.nextPage(
        duration: theme.duration.medium,
        curve: theme.curve.enter,
      );
    } else {
      Navigator.pop(context, artboard);
    }

    return artboard.popped;
  }

  bool _pop<T>([T result]) {
    widget.artboard.didComplete();
    return Navigator.pop(context, result);
  }

  void _onVerticalDragStart(DragStartDetails details) {
    _initialDragTime = details.sourceTimeStamp.inMilliseconds;
    _initialDragDy = details.globalPosition.dy;
  }

  void _onDragDownUpdate(DragUpdateDetails details) {
    _timeDelta = details.sourceTimeStamp.inMilliseconds - _initialDragTime;
    _downDistanceDelta = details.globalPosition.dy - _initialDragDy;
  }

  void toggleNavButtonsHidden(bool isHidden) {
    setState(
      () => toggleNavButtonVisibilityTo(!isHidden),
    );
  }

  VerticalFloatingArtboardNavigatorPanel _buildPanelForArtboard<T>(
      VerticalFloatingArtboard<T> artboard) {
    final artboardIsFirst = _floatingArtboardPanels.isEmpty ||
        artboard == _floatingArtboardPanels.first.artboard;

    final defaultNavButtonOption = artboardIsFirst
        ? VerticalFloatingArtboardButtonOption.close
        : VerticalFloatingArtboardButtonOption.previous;

    final page = VerticalFloatingArtboardNavigatorPanel(
      artboard: artboard,
      defaultNavButtonOption: defaultNavButtonOption,
    );

    return page;
  }
}

class _VerticalFloatingInheritedArtboardNavigator extends InheritedWidget {
  final VerticalFloatingInheritedArtboardNavigator data;

  _VerticalFloatingInheritedArtboardNavigator({
    @required this.data,
    @required Widget child,
  }) : super(
          child: child,
        );

  @override
  bool updateShouldNotify(_VerticalFloatingInheritedArtboardNavigator old) =>
      false;
}
