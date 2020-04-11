import 'package:flutter/material.dart';
import '_components/view_stream_builder.dart';

mixin ViewStreamBuilderBuilder {
  ViewStreamBuilder<T> buildViewStreamBuilder<T>(
    BuildContext context, {
    @required Stream<T> stream,
    Widget loading,
    Widget empty,
    @required Widget Function(BuildContext, T) child,
  }) {
    return ViewStreamBuilder<T>(
      stream: stream,
      loading: loading,
      empty: empty,
      child: child,
    );
  }
}
