import 'package:flutter/material.dart';

class InheritedScrollControllerProvider extends StatefulWidget {
  final ScrollController scrollController;
  final Widget child;

  InheritedScrollControllerProvider({
    @required this.scrollController,
    @required this.child,
  });

  @override
  _InheritedScrollControllerState createState() =>
      _InheritedScrollControllerState();
}

class _InheritedScrollControllerState
    extends State<InheritedScrollControllerProvider> {
  @override
  Widget build(BuildContext context) {
    return ScrollControllerInheritedWidget(
      widget.scrollController,
      child: widget.child,
    );
  }
}

class ScrollControllerInheritedWidget extends InheritedWidget {
  final ScrollController scrollController;

  ScrollControllerInheritedWidget(
    this.scrollController, {
    @required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return oldWidget != this;
  }
}
