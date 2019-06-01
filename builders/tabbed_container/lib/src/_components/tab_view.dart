import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:visibility_manager/index.dart';
import 'package:tab/index.dart';

class RoofTabView extends StatefulWidget {
  const RoofTabView({
    @required this.tabs,
    @required this.controller,
  });

  final TabController controller;
  final List<RoofTab> tabs;

  @override
  _RoofTabViewState createState() => _RoofTabViewState();
}

class _RoofTabViewState extends State<RoofTabView> {
  TabController _controller;
  PageController _pageController;
  VisibilityManager _dockVisibilityManager;
  List<Widget> _children;
  int _currentIndex;
  int _warpUnderwayCount = 0;

  List<Widget> _buildTabViews() {
    return widget.tabs.map((tab) => tab.view).toList();
  }

  void _updateTabController() {
    _controller.animation.addListener(_handleTabControllerAnimationTick);
    _controller.animation.addListener(_dockVisibleForTab);
  }

  @override
  void initState() {
    super.initState();

    _children = _buildTabViews();
    _controller = widget.controller;

    WidgetsBinding.instance.addPostFrameCallback(
      (Duration d) => _dockVisibleForTab(),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateTabController();
    _currentIndex = _controller?.index;
    _pageController = PageController(initialPage: _currentIndex ?? 0);
    _dockVisibilityManager = InheritedVisibilityManager.of(context);
  }

  @override
  void didUpdateWidget(RoofTabView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.tabs != oldWidget.tabs && _warpUnderwayCount == 0)
      _children = _buildTabViews();
  }

  @override
  void dispose() {
    if (_controller != null)
      _controller.animation.removeListener(_handleTabControllerAnimationTick);
    super.dispose();
  }

  void _dockVisibleForTab() {
    if (_dockVisibilityManager == null) return;

    final offset = _controller.offset;
    final bool dragging = offset != 0;

    int index = _controller.index;

    if (dragging && offset.abs() > .5) {
      if (offset > 0) {
        index += 1;
      } else if (offset < 0) {
        index -= 1;
      }
    }

    final newTab = widget.tabs[index];
    final visible = newTab.hasDock ?? false;

    _dockVisibilityManager.setVisibility(visible);
  }

  void _handleTabControllerAnimationTick() {
    // widget.onDragCallback();
    _dockVisibleForTab();

    if (_warpUnderwayCount > 0 || !_controller.indexIsChanging) return;

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
      _children = List<Widget>.from(_buildTabViews(), growable: false);
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
      _children = _buildTabViews();
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
