import 'package:flutter/material.dart';

import './roofui_bloc_base.dart';

class RoofUIBlocProvider<T extends RoofUIBlocBase> extends StatefulWidget {
  RoofUIBlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key);

  final T bloc;
  final Widget child;

  @override
  _RoofUIBlocProviderState<T> createState() => _RoofUIBlocProviderState<T>();

  static T of<T extends RoofUIBlocBase>(BuildContext context) {
    final type = _typeOf<RoofUIBlocProvider<T>>();
    RoofUIBlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;
}

class _RoofUIBlocProviderState<T>
    extends State<RoofUIBlocProvider<RoofUIBlocBase>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
