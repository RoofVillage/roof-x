import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nav_button_builder/index.dart';
import 'package:semantic_theme/index.dart';

import 'vertical_drawer_artboard.dart';

class VerticalDrawerArtboardNavigatorPanel<T> extends StatefulWidget {
  final VerticalDrawerArtboard artboard;

  VerticalDrawerArtboardNavigatorPanel({
    this.artboard,
  });

  @override
  State<StatefulWidget> createState() =>
      InheritedVerticalDrawerArtboardNavigatorPanel<T>();

  static InheritedVerticalDrawerArtboardNavigatorPanel of(
    BuildContext context, {
    bool shouldRebuild = true,
  }) {
    final inheritedWidget = shouldRebuild
        ? context.dependOnInheritedWidgetOfExactType<
            _InheritedVerticalDrawerArtboardNavigatorPanel>()
        : context.findAncestorWidgetOfExactType<
            _InheritedVerticalDrawerArtboardNavigatorPanel>();

    return inheritedWidget.data;
  }
}

// https://docs.flutter.io/flutter/widgets/AutomaticKeepAliveClientMixin-mixin.html
// https://github.com/flutter/flutter/issues/13080#issuecomment-399320752
class InheritedVerticalDrawerArtboardNavigatorPanel<T>
    extends State<VerticalDrawerArtboardNavigatorPanel<T>>
    with AutomaticKeepAliveClientMixin, IconNavButtonBuilder {
  bool _wantKeepAlive = true;
  T _result;

  set result(T value) => setState(() => _result = value);
  get result => _result;

  @override
  bool get wantKeepAlive => _wantKeepAlive;

  @override
  Widget build(BuildContext context) {
    super.build(context); //necessary for the mixin.

    final theme = SemanticTheme.of(context);

    final drawerWidth = min(
      MediaQuery.of(context).size.width * .85,
      310.0,
    );

    final drawer = Stack(
      children: <Widget>[
        Container(
          constraints: BoxConstraints(
            maxWidth: drawerWidth,
          ),
          child: widget.artboard,
          decoration: BoxDecoration(
            boxShadow: [theme.shadow.large],
          ),
        )
      ],
    );

    return _InheritedVerticalDrawerArtboardNavigatorPanel(
      data: this,
      child: drawer,
    );
  }

  @override
  void dispose() {
    _wantKeepAlive = false;
    updateKeepAlive();
    super.dispose();
  }
}

class _InheritedVerticalDrawerArtboardNavigatorPanel extends InheritedWidget {
  final InheritedVerticalDrawerArtboardNavigatorPanel data;

  _InheritedVerticalDrawerArtboardNavigatorPanel({
    @required this.data,
    @required Widget child,
  }) : super(
          child: child,
        );

  @override
  bool updateShouldNotify(_InheritedVerticalDrawerArtboardNavigatorPanel old) =>
      true;
}
