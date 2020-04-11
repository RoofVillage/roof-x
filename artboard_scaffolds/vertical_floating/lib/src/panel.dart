import 'package:flutter/material.dart';
import 'package:navigation_icon_library/index.dart';
import 'package:icon_button_builder/index.dart';
import 'package:navigator/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:vertical_floating_artboard_button_option/index.dart';

import 'vertical_floating_artboard.dart';
import 'navigator.dart';

class VerticalFloatingArtboardNavigatorPanel<T> extends StatefulWidget {
  final VerticalFloatingArtboard artboard;
  final VerticalFloatingArtboardButtonOption defaultNavButtonOption;

  VerticalFloatingArtboardNavigatorPanel({
    this.artboard,
    @required this.defaultNavButtonOption,
  });

  @override
  State<StatefulWidget> createState() =>
      InheritedVerticalFloatingArtboardNavigatorPanel<T>();

  static InheritedVerticalFloatingArtboardNavigatorPanel of(
    BuildContext context, {
    bool shouldRebuild = true,
  }) {
    final inheritedWidget = shouldRebuild
        ? context.dependOnInheritedWidgetOfExactType<
            _InheritedVerticalFloatingArtboardNavigatorPanel>()
        : context.findAncestorWidgetOfExactType<
            _InheritedVerticalFloatingArtboardNavigatorPanel>();

    return inheritedWidget.data;
  }
}

// https://docs.flutter.io/flutter/widgets/AutomaticKeepAliveClientMixin-mixin.html
// https://github.com/flutter/flutter/issues/13080#issuecomment-399320752
class InheritedVerticalFloatingArtboardNavigatorPanel<T>
    extends State<VerticalFloatingArtboardNavigatorPanel<T>>
    with AutomaticKeepAliveClientMixin, NavIconButtonBuilder {
  bool _wantKeepAlive = true;
  T _result;

  set result(T value) => setState(() => _result = value);
  get result => _result;

  @override
  bool get wantKeepAlive => _wantKeepAlive;

  @override
  Widget build(BuildContext context) {
    super.build(context); //necessary for the mixin.

    final flexibleColumn = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: SingleChildScrollView(
            child: widget.artboard,
          ),
        )
      ],
    );

    List<Widget> children = [flexibleColumn];
    if (VerticalFloatingArtboardNavigator.of(context).showsNavButton) {
      final navButtonBar = _navButtonBar(context);
      children.add(navButtonBar);
    }

    final child = Stack(
      alignment: AlignmentDirectional.center,
      children: children,
    );
    return _InheritedVerticalFloatingArtboardNavigatorPanel(
      data: this,
      child: child,
    );
  }

  @override
  void dispose() {
    _wantKeepAlive = false;
    updateKeepAlive();
    super.dispose();
  }

  void completeWith<T>(T result) {
    widget.artboard.didComplete(result);
    VerticalFloatingArtboardNavigator.of(
      context,
      shouldRebuild: false,
    ).back(context);
  }

  Widget _navButtonBar(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final buttonOption =
        widget.artboard.navButtonOption ?? widget.defaultNavButtonOption;

    CrossAxisAlignment crossAxisAlignment;

    switch (buttonOption) {
      case VerticalFloatingArtboardButtonOption.close:
        crossAxisAlignment = CrossAxisAlignment.center;
        break;
      case VerticalFloatingArtboardButtonOption.previous:
        crossAxisAlignment = CrossAxisAlignment.start;
        break;
    }

    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: GestureDetector(
        onTap: () => null, // block onTap from propagating to parent
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: theme.distance.gutter.horizontal.medium,
          ),
          decoration: BoxDecoration(
            color: theme.color.background.general,
            border: Border(
              top: BorderSide(
                color: theme.color.stroke.light,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: crossAxisAlignment,
            children: [
              _navButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navButton(BuildContext context) {
    final buttonOption =
        widget.artboard.navButtonOption ?? widget.defaultNavButtonOption;

    Widget button;
    switch (buttonOption) {
      case VerticalFloatingArtboardButtonOption.close:
        button = buildNavIconButton(
          iconReference: NavigationIcon.downArrow,
          onTap: () => ArtboardNavigator.of(context).pop(_result),
        );
        break;
      case VerticalFloatingArtboardButtonOption.previous:
        button = buildNavIconButton(
          iconReference: NavigationIcon.backArrow,
          onTap: () {
            widget.artboard.didComplete(_result);
            VerticalFloatingArtboardNavigator.of(
              context,
              shouldRebuild: false,
            ).back(context);
          },
        );
        break;
    }

    return button;
  }
}

class _InheritedVerticalFloatingArtboardNavigatorPanel extends InheritedWidget {
  final InheritedVerticalFloatingArtboardNavigatorPanel data;

  _InheritedVerticalFloatingArtboardNavigatorPanel({
    @required this.data,
    @required Widget child,
  }) : super(
          child: child,
        );

  @override
  bool updateShouldNotify(
          _InheritedVerticalFloatingArtboardNavigatorPanel old) =>
      true;
}
