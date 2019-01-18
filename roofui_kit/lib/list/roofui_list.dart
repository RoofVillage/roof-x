import 'package:flutter/material.dart';

import 'package:roofui_kit/stream/roofui_bloc_provider.dart';
import 'package:roofui_kit/stream/roofui_list_bloc.dart';
import 'package:roofui_kit/stream/roofui_streamable_data.dart';

class RoofUIList<T extends RoofUIListBloc, S extends RoofUIStreamableData>
    extends StatelessWidget {
  final Widget Function(S data) builder;

  RoofUIList({Key key, @required this.builder}) : super(key: key);

  Widget build(BuildContext context) {
    final T listBloc = RoofUIBlocProvider.of<T>(context);
    return StreamBuilder<List<RoofUIStreamableData>>(
        stream: listBloc.outList,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container(child: Text("Moo"));

          final list = snapshot.data;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              final initialData = list[index];
              return StreamBuilder<RoofUIStreamableData>(
                  stream: listBloc.outData
                      .where((data) => data.id == initialData.id),
                  initialData: initialData,
                  builder: (context, snapshot) {
                    return builder(snapshot.data);
                  });
            },
          );
        });
  }
}
