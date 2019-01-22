import 'package:flutter/material.dart';
import 'package:table/index.dart';
import 'package:spec/index.dart';

import '_bloc.dart';
import 'data/index.dart';

class Root extends StreamTable<Bloc, PublicActivityData,
    StreamableTableSectionHeaderData, StreamableTableHeaderData> {
  @override
  Widget buildRow(
      {PublicActivityData rowData, int rowIndex, int sectionIndex}) {
    final section = Section.values[sectionIndex];

    switch (section) {
      case Section.completions:
        return RoofCellA(
            titleText: rowData.title,
            detailText: "Doodoo " + (rowData.description ?? ""),
            iconReference: rowData.iconReference);
      default:
        return RoofCellA(
            titleText: rowData.title,
            detailText: "Nope" + (rowData.description ?? ""),
            iconReference: rowData.iconReference);
    }
  }

  @override
  SliverPersistentHeader buildSectionHeader(
      {StreamableTableSectionHeaderData headerData, int sectionIndex}) {
    return RoofTableSectionHeaderA(title: headerData.title);
  }
}
