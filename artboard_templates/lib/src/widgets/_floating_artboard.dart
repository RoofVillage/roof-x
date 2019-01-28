import 'package:flutter/material.dart';

class FloatingArtboard extends StatefulWidget {
  final Widget page;

  FloatingArtboard({this.page});

  @override
  State<StatefulWidget> createState() => FloatingArtboardState(page: page);
}

class FloatingArtboardState extends State<FloatingArtboard> {
  final List<Widget> _pages;

  FloatingArtboardState({Widget page}) : _pages = [page];

  final _popMinDragDistanceDelta = 50;
  final _popMaxDragTimeDelta = 70;
  final _pageController = PageController();

  int _initialDragTime;
  double _initialDragDy;

  int _timeDelta;
  double _downDistanceDelta;

  get _shouldPop =>
      _timeDelta < _popMinDragDistanceDelta &&
      _downDistanceDelta > _popMaxDragTimeDelta;

  @override
  Widget build(BuildContext context) {
    final pageView = PageView(controller: _pageController, children: _pages);

    return GestureDetector(
        onTap: (() => Navigator.pop(context)),
        onVerticalDragStart: _onVerticalDragStart,
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta < 0) return;
          _onDragDownUpdate(details);
          if (_shouldPop) Navigator.pop(context);
        },
        behavior: HitTestBehavior.opaque,
        child: pageView);
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
