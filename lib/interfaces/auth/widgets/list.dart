import 'package:flutter/material.dart';
import 'package:roofui_kit/cell/a/index.dart';
import '../data/public_activity_data.dart';

class AuthList extends StatelessWidget {
  final List<PublicActivityData> data;

  AuthList({this.data = const []});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          final dataItem = data[index];
          return RoofUICellA(
              titleText: dataItem.title,
              detailText: dataItem.description,
              iconReference: dataItem.iconReference);
        });
  }
}
