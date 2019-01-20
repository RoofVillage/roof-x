import 'package:flutter/material.dart';

import 'package:roofui_kit/table/roofui_table.dart';
import 'package:roofui_kit/cell/a/roofui_cell_a.dart';
import 'package:roofui_kit/stream/roofui_streamable_data.dart';

import '../bloc/_auth_bloc.dart';
import '../data/_public_activity_data.dart';
import '../data/_sections.dart';

class AuthList extends StatelessWidget with RowBuilder<PublicActivityData> {
  Widget build(BuildContext context) {
    return RoofUITable<AuthBloc>(buildRow: buildRow);
  }

  Widget buildRow(
      {PublicActivityData rowData, int rowIndex, int sectionIndex}) {
    final section = Section.values[sectionIndex];

    switch (section) {
      case Section.completions:
        return RoofUICellA(
            titleText: rowData.title,
            detailText: "Doodoo " + rowData.description,
            assetReference: rowData.assetReference);
      default:
        return RoofUICellA(
            titleText: rowData.title,
            detailText: "Nope" + rowData.description,
            assetReference: rowData.assetReference);
    }
  }
}

abstract class RowBuilder<S extends RoofUIStreamableData> {
  Widget buildRow({S rowData, int rowIndex, int sectionIndex});
}

abstract class TableHeaderBuilder<S extends RoofUIStreamableTableHeaderData> {
  Widget buildTableHeader({S headerData});
}

abstract class SectionHeaderBuilder<
    S extends RoofUIStreamableSectionHeaderData> {
  Widget buildSectionHeader({S headerData, int sectionIndex});
}
