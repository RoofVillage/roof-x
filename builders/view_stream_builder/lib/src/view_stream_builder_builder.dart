import '_components/view_stream_builder.dart';

mixin ViewStreamBuilderBuilder {
  ViewStreamBuilder buildViewStreamBuilder(
    BuildContext context, {
    Stream stream,
    Widget loading,
    Widget empty,
    Widget Function(BuildContext, T) child,
  }) {
    return ViewStreamBuilder(
      stream: stream,
      loading: loading,
      empty: empty,
      child: child,
    );
  }
}
