import 'package:flutter/material.dart';

import 'package:roofui_kit/stream/roofui_form_bloc.dart';
import 'package:roofui_kit/stream/roofui_streamable_data.dart';

import "../list/roofui_list.dart";

class RoofUIForm<T extends RoofUIFormBloc, S extends RoofUIStreamableData>
    extends StatelessWidget {
  final Widget Function({@required S data, int row, int section}) buildItem;
  final Widget Function({int section}) buildSectionHeader;

  RoofUIForm({Key key, @required this.buildItem, this.buildSectionHeader})
      : super(key: key);

  Widget build(BuildContext context) {
    return RoofUIList<T, S>(
        buildItem: buildItem, buildSectionHeader: buildSectionHeader);
  }
}
