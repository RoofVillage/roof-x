import 'package:flutter/material.dart';
import 'package:nav_bar_builder/index.dart';
import 'package:table_builder/index.dart';
import 'package:input_dock_builder/index.dart';
import 'package:artboard/index.dart';
import 'package:vertical_full_screen_artboard_scaffold/index.dart';
import 'package:key_value_row_builder/index.dart';
import 'package:tabbed_container_builder/index.dart';
import 'package:breadcrumb_stack_builder/index.dart';
import 'package:theme/index.dart';
import 'package:duration/index.dart' as duration;
import 'package:curve/index.dart' as curve;
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;

abstract class TabbedCollapsibleFullScreenArtboard extends StatefulWidget
    with
        VerticalFullScreenArtboard,
        Artboard,
        TableBuilder,
        InputDockBuilder,
        TitledIconNavBarBuilder,
        RoofBreadcrumbBuilder,
        KeyValueRowBuilder,
        InputDockBuilder,
        RoofTabbedContainerBuilder {
  @override
  Widget buildNavBar(BuildContext context) => buildTitledIconNavBar(context);

  Widget buildTabCollapsibleDock(BuildContext context) => null;

  final GlobalKey<_CollapsibleContainerState> dockKey = GlobalKey();

  _CollapsibleContainer collapsibleDock(BuildContext context) =>
      _CollapsibleContainer(
        child: buildTabCollapsibleDock(context),
        key: dockKey,
      );

  @override
  Widget buildDock(BuildContext context) => collapsibleDock(context);

  bool get hideHeaderInitially => false;

  List<RoofBreadcrumb> buildBreadcrumbs(BuildContext context);
  List<Widget> buildInfoRows(BuildContext context);
  List<RoofTab> buildTabs(BuildContext context);

  @override
  Widget buildBody(BuildContext context) {
    final theme = RoofTheme.of(context);

    List<Widget> headerChildren = [];

    final breadcrumbs = buildBreadcrumbs(context);
    if (breadcrumbs != null && breadcrumbs.isNotEmpty) {
      final breadcrumbStack = Container(
        margin: EdgeInsets.only(bottom: distance.b),
        child: buildBreadcrumbStack(
          context,
          breadcrumbs: buildBreadcrumbs(context),
        ),
      );

      headerChildren.add(breadcrumbStack);
    }

    final infoRows = buildInfoRows(context);
    if (infoRows != null && infoRows.isNotEmpty) {
      final infoSection = Container(
        padding: EdgeInsets.all(distance.b),
        child: Column(
          children: buildInfoRows(context),
        ),
      );

      headerChildren.add(infoSection);
    }

    void updateDockVisibility(
      BuildContext context, {
      @required bool visible,
    }) {
      final collapsibleDockContainer = dockKey.currentState;
      collapsibleDockContainer?.setVisibility(visible);
    }

    final tabbedContainer = buildTabbedContainer(
      context,
      buildTabs(context),
      dockVisibilityListener: (bool visible) =>
          updateDockVisibility(
            context,
            visible: visible,
          ),
    );

    final previewRow = Container(
      padding: EdgeInsets.symmetric(horizontal: distance.b),
      child: Text(
        "\$12,000/mo due on the 1st",
        style: typography.bodySecondary.textStyleWithColor(
          theme.color.text.secondary,
        ),
      ),
    );

    return tabbedContainer;

    return _ScrollView(
      headerChildren: [previewRow],
      // previewRow: previewRow,
      tabbedContainer: tabbedContainer,
      initiallyCollapsed: hideHeaderInitially,
    );
  }
}

class _ScrollView extends StatefulWidget {
  final List<Widget> headerChildren;
  final Widget previewRow;
  final RoofTabbedContainer tabbedContainer;
  final bool initiallyCollapsed;

  _ScrollView({
    this.headerChildren,
    this.previewRow,
    this.tabbedContainer,
    this.initiallyCollapsed,
  });

  @override
  _ScrollViewState createState() => _ScrollViewState();
}

class _ScrollViewState extends State<_ScrollView> {
  final _controller = ScrollController();

  double _maxHeaderHeight;
  double _headerOpacity = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_getHeaderHeight);
    _controller.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    _setHeaderOpacity();
  }

  void _setHeaderOpacity() {
    if (_maxHeaderHeight == null) return;

    final newOpacity = 1 - (_controller.offset / _maxHeaderHeight);

    if (newOpacity > 1 || newOpacity < 0) return;

    setState(() {
      _headerOpacity = newOpacity;
    });
  }

  void _getHeaderHeight(_) {
    _maxHeaderHeight = _controller.position.maxScrollExtent;

    if (widget.initiallyCollapsed) _controller.jumpTo(_maxHeaderHeight);
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final headerOpacityContainer = Opacity(
      opacity: _headerOpacity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.headerChildren,
      ),
    );

    final headerContainer = Container(
      color: theme.color.background.generalPrimary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.headerChildren,
      ),
    );

    return NestedScrollView(
      controller: _controller,
      physics: BouncingScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverList(
            delegate: SliverChildListDelegate(
              [headerContainer],
            ),
          ),
        ];
      },
      body: widget.tabbedContainer,
    );
  }
}

class _CollapsibleContainer extends StatefulWidget {
  final Widget child;

  _CollapsibleContainer({this.child, Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CollapsibleContainerState();
}

class _CollapsibleContainerState extends State<_CollapsibleContainer>
    with SingleTickerProviderStateMixin {
  bool _visible = false;

  final _duration = duration.short;
  final _curve = curve.quick;

  void setVisibility(bool visible) {
    print("setVisibility $visible");

    setState(() {
      _visible = visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: _duration,
      curve: _curve,
      vsync: this,
      child: Container(
        height: _visible ? null : 0,
        child: widget.child,
      ),
    );
  }
}
