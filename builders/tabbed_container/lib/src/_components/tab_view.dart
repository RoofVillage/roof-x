import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RoofTabView extends StatelessWidget {
  final List<Widget> views;
  final TabController tabController;
  final VoidCallback onDragCallback;

  const RoofTabView({
    @required this.views,
    @required this.tabController,
    this.onDragCallback,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoofTabBarView(
      children: views,
      controller: tabController,
      onDragCallback: onDragCallback,
    );
  }
}

class RoofTabBarView extends StatefulWidget {
  const RoofTabBarView({
    @required this.children,
    @required this.controller,
    this.onDragCallback
  });

  final TabController controller;
  final List<Widget> children;
  final VoidCallback onDragCallback;

  @override
  _RoofTabBarViewState createState() => _RoofTabBarViewState();
}

class _RoofTabBarViewState extends State<RoofTabBarView> {
  TabController _controller;
  PageController _pageController;
  List<Widget> _children;
  int _currentIndex;
  int _warpUnderwayCount = 0;

  void _updateTabController() {
    _controller.animation.addListener(_handleTabControllerAnimationTick);
  }

  @override
  void initState() {
    super.initState();
    _children = widget.children;
    _controller = widget.controller;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateTabController();
    _currentIndex = _controller?.index;
    _pageController = PageController(initialPage: _currentIndex ?? 0);
  }

  @override
  void didUpdateWidget(RoofTabBarView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.children != oldWidget.children && _warpUnderwayCount == 0)
      _children = widget.children;
  }

  @override
  void dispose() {
    if (_controller != null)
      _controller.animation.removeListener(_handleTabControllerAnimationTick);
    super.dispose();
  }

  void _handleTabControllerAnimationTick() {
    widget.onDragCallback();

    if (_warpUnderwayCount > 0 || !_controller.indexIsChanging)
      return;

    if (_controller.index != _currentIndex) {
      _currentIndex = _controller.index;
      _warpToCurrentIndex();
    }
  }

  Future<void> _warpToCurrentIndex() async {
    if (!mounted) return Future<void>.value();

    if (_pageController.page == _currentIndex.toDouble())
      return Future<void>.value();

    final int previousIndex = _controller.previousIndex;
    if ((_currentIndex - previousIndex).abs() == 1)
      return _pageController.animateToPage(_currentIndex,
          duration: kTabScrollDuration, curve: Curves.ease);

    assert((_currentIndex - previousIndex).abs() > 1);
    int initialPage;
    setState(() {
      _warpUnderwayCount += 1;
      _children = List<Widget>.from(widget.children, growable: false);
      if (_currentIndex > previousIndex) {
        _children[_currentIndex - 1] = _children[previousIndex];
        initialPage = _currentIndex - 1;
      } else {
        _children[_currentIndex + 1] = _children[previousIndex];
        initialPage = _currentIndex + 1;
      }
    });

    _pageController.jumpToPage(initialPage);

    await _pageController.animateToPage(_currentIndex,
        duration: kTabScrollDuration, curve: Curves.ease);
    if (!mounted) return Future<void>.value();

    setState(() {
      _warpUnderwayCount -= 1;
      _children = widget.children;
    });
  }

  // Called when the PageView scrolls
  bool _handleScrollNotification(ScrollNotification notification) {
    if (_warpUnderwayCount > 0) return false;

    if (notification.depth != 0) return false;

    _warpUnderwayCount += 1;
    if (notification is ScrollUpdateNotification &&
        !_controller.indexIsChanging) {
      if ((_pageController.page - _controller.index).abs() > 1.0) {
        _controller.index = _pageController.page.floor();
        _currentIndex = _controller.index;
      }
      _controller.offset =
          (_pageController.page - _controller.index).clamp(-1.0, 1.0);
    } else if (notification is ScrollEndNotification) {
      _controller.index = _pageController.page.round();
      _currentIndex = _controller.index;
    }
    _warpUnderwayCount -= 1;

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: PageView(
        dragStartBehavior: DragStartBehavior.start,
        controller: _pageController,
        physics: ScrollPhysics(),
        children: _children,
      ),
    );
  }
}
