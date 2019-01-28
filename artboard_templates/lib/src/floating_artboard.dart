import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';

abstract class RoofFloatingArtboard extends StatelessWidget {
  Widget get body;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final scaffold = Scaffold(
        body: _FloatingModal(page: body), backgroundColor: Colors.transparent);

    return RoofTheme(theme.current, child: scaffold);
  }
}

class _FloatingModal extends StatefulWidget {
  final Widget page;

  _FloatingModal({this.page});

  @override
  State<StatefulWidget> createState() => _FloatingModalState(page: page);
}

class _FloatingModalState extends State<_FloatingModal> {
  final List<Widget> _pages;

  _FloatingModalState({Widget page}) : _pages = [page];

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

class FloatingArtboard extends StatelessWidget {
  final _bottomSheetMargin = EdgeInsets.all(RoofDistance.f);
  final _sizeConstraints = BoxConstraints(minHeight: 300);

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final bottomSheetDecoration = BoxDecoration(
        color: theme.color.background.brandSecondary,
        borderRadius: BorderRadius.all(RoofCornerRadius.large),
        boxShadow: [theme.shadow]);
    return Container(
        margin: _bottomSheetMargin,
        decoration: bottomSheetDecoration,
        child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: ConstrainedBox(
                constraints: _sizeConstraints,
                child: Container(
                  color: Colors.white,
                ))));
  }
}

// class _Button extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: _onTap,
//         child: Container(color: Colors.red, child: Text("TAP ME")));
//   }

//   _onTap() {}
// }
