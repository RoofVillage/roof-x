// import 'package:flutter/material.dart';

// import 'package:roofui_kit/stream/roofui_bloc_provider.dart';
// import 'package:roofui_kit/stream/roofui_list_bloc.dart';
// import 'package:roofui_kit/stream/roofui_streamable_data.dart';

// class RoofUITable<T extends RoofUIListBloc, S extends RoofUIStreamableData>
//     extends StatelessWidget {
//   final Widget Function({@required S data, int row, int section}) buildItem;
//   final Widget Function({int section}) buildSectionHeader;

//   RoofUITable(
//       {Key key, @required this.buildItem, @required this.buildSectionHeader})
//       : super(key: key);

//   Widget build(BuildContext context) {
//     final T listBloc = RoofUIBlocProvider.of<T>(context);
//     return StreamBuilder<List<RoofUIStreamableData>>(
//         stream: listBloc.outList,
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) return Container(child: Text("Moo"));

//           return _listBuilder(
//               bloc: listBloc, context: context, list: snapshot.data);
//         });
//   }

//   Widget _listBuilder(
//       {@required T bloc,
//       @required BuildContext context,
//       @required List<RoofUIStreamableData> list}) {
//     final builder = ListView.builder(
//       itemCount: list.length,
//       itemBuilder: (BuildContext context, int index) {
//         final initialData = list[index];

//         final row;
//         final section;

//         ///check wtf initialData is;
//         return StreamBuilder<RoofUIStreamableData>(
//             stream: bloc.outData.where((data) => data.id == initialData.id),
//             initialData: initialData,
//             builder: (context, snapshot) {
//               return buildItem(data: snapshot.data, row: index, section: 0);
//             });
//       },
//     );

//     return builder;
//   }
// }
