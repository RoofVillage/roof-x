import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

import 'package:spec/index.dart';

class FloatingModalRoute extends ModalRoute<void> {
  RoofThemeOption currentTheme;
  Widget body;

  @override
  Duration get transitionDuration => RoofDuration.short;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor =>
      RoofSemanticColor(current: currentTheme).background.scrim;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => false;

  @override
  Animation<double> get animation =>
      controller.drive(_curveTween).drive(_fadeTween);

  final _curveTween = CurveTween(curve: Curves.easeOut);
  final _fadeTween = Tween<double>(begin: 0.0, end: 1);
  final _slideTween = Tween<Offset>(begin: Offset(0.0, 0.1), end: Offset.zero);

  FloatingModalRoute({@required this.currentTheme, @required this.body});

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final slidingBottomSheet = SlideTransition(
        position: animation.drive(_slideTween), child: _FloatingModal());

    final scaffold =
        Scaffold(body: slidingBottomSheet, backgroundColor: Colors.transparent);

    return RoofTheme(currentTheme, child: scaffold);
  }
}

class _FloatingModal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FloatingModalState();
}

class _FloatingModalState extends State<_FloatingModal> {
  final List<Widget> _pages = [
    Container(color: Colors.transparent, child: _Page())
  ];

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

  // _go() {
  //   final container =
  //       Container(color: null, child: _RoofBottomSheetContentArea());
  //   setState(() => bottomSheets.add(container));
  //   pageController.nextPage(
  //       duration: Duration(milliseconds: 1000), curve: Curves.easeOut);
  // }
}

class _Page extends StatelessWidget {
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

class _Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _onTap,
        child: Container(color: Colors.red, child: Text("TAP ME")));
  }

  _onTap() {}
}
