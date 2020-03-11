import 'package:flutter/cupertino.dart';

class ViewStreamBuilder<T> extends StatelessWidget {
  final Stream<T> stream;
  final Widget loading;
  final Widget empty;
  final Widget Function(BuildContext, T) child;

  ViewStreamBuilder({
    @required this.stream,
    this.loading,
    this.empty,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return loading ?? Container();
        } else if (snapshot.data is List && (snapshot.data as List).isEmpty) {
          return empty ?? Container();
        } else if (snapshot.data == null) {
          return empty ?? Container();
        }

        return child(context, snapshot.data);
      },
    );
  }
}
