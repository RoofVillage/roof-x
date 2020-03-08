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
    print('stream $stream');
    return StreamBuilder<T>(
      stream: stream,
      builder: (context, snapshot) {
        print('data: ${snapshot.data}');
        if (!snapshot.hasData) {
          print('NO DATA');
          return loading;
        } else if (snapshot.data is List && (snapshot.data as List).isEmpty) {
          print('EMPTY');
          return empty;
        } else if (snapshot.data == null) {
          print('HAS DATA');
          return empty;
        }

        return child(context, snapshot.data);
      },
    );
  }
}
