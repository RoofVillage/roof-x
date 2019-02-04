import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:table/index.dart';
import 'package:icon_library/index.dart';
import 'package:decorated_text/index.dart';
import 'package:services/index.dart';
import 'package:artboard_templates/index.dart';
import 'package:navigation_components/index.dart';
import 'package:table_components/index.dart';
import 'package:artboard_navigators/index.dart';

import 'data/index.dart';

import '../sign_up/index.dart';

class PublicActivityArtboard extends FullLogoFullScreenArtboard {
  final _showFloatingArtboardButton = RoofIconNavButton(
      iconReference: IconReference.add,
      onTap: (context) {
        ArtboardNavigator.of(context).goTo(SignUpArtboard(), context: context);
      });

  final _showFullScreenArtboardButton = RoofIconNavButton(
      iconReference: IconReference.settingsNav,
      onTap: (context) {
        ArtboardNavigator.of(context)
            .goTo(PublicActivityArtboard(), context: context);
      });

  final _popButton = RoofIconNavButton(
      iconReference: IconReference.backArrowNav, onTap: ArtboardNavigator.pop);

  @override
  WidgetBuilder get buildBody => (context) => _PublicActivityTable();

  @override
  List<RoofNavButton> get actionButtons =>
      [_popButton, _showFloatingArtboardButton, _showFullScreenArtboardButton];
}

class _PublicActivityTable extends StreamTable<PublicActivityData,
    StreamableTableSectionHeaderData, StreamableTableHeaderData> {
  @override
  Future<StreamableTableData> get initialTableData async {
    //Format it the activity into streamable data on different thread.
    final response = await GetPublicActivity().request(pageSize: 50);

    final streamableData = await compute<String, List<PublicActivityData>>(
        _streamableDataFromResponse, response);

    ///Make table data;
    final tableData = StreamableTableData(sectionData: [
      Sections.dataForSection(Section.completions),
      Sections.dataForSection(Section.expenses),
      Sections.dataForSection(Section.transfers),
      Sections.dataForSection(Section.landlordTransfers),
      Sections.dataForSection(Section.maintenance),
    ], rowData: streamableData);

    return tableData;
  }

  @override
  Widget buildRow(
      {PublicActivityData rowData, int rowIndex, int sectionIndex}) {
    final section = Section.values[sectionIndex];

    switch (section) {
      case Section.completions:
        return RoofCellA(
            titleText: rowData.title,
            detailText: "" + (rowData.description ?? ""),
            iconReference: rowData.iconReference);
      default:
        return RoofCellA(
            titleText: rowData.title,
            detailText: "" + (rowData.description ?? ""),
            iconReference: rowData.iconReference);
    }
  }

  @override
  SliverPersistentHeader buildSectionHeader(
      {StreamableTableSectionHeaderData headerData, int sectionIndex}) {
    return RoofTableSectionHeaderA(title: headerData.title);
  }
}

List<PublicActivityData> _streamableDataFromResponse(String response) {
  final dataConvertedToJson = json.decode(response);
  final List publicActivity = dataConvertedToJson[Param.publicActivity];

  final data = publicActivity.map((json) {
    switch (json[Param.activityType]) {
      case Param.completion:
        return _dataForCompletion(json);
      case Param.expense:
        return _dataForExpense(json);
      case Param.transfer:
        return _dataForTransfer(json);
      case Param.landlordTransfer:
        return _dataForLandlordTransfer(json);
      case Param.maintenance:
        return _dataForMaintenance(json);
    }
  }).toList();

  return data;
}

PublicActivityData _dataForCompletion(Map<String, Object> json) {
  final String who = json[Param.who];
  final String name = json[Param.name];
  final String roof = json[Param.roof];
  final String note = json[Param.note];

  final decoratedTitle = WeightDecoratedText();

  decoratedTitle.addSection(text: who);
  decoratedTitle.addSection(text: 'completed', thin: true);
  decoratedTitle.addSection(text: name);
  decoratedTitle.addSection(text: 'at', thin: true);
  decoratedTitle.addSection(text: roof);

  return PublicActivityData(
      title: decoratedTitle,
      description: note,
      iconReference: IconReference.complete,
      type: PublicActivityType.completion,
      timestamp: 12221);
}

PublicActivityData _dataForExpense(Map<String, Object> json) {
  final String who = json[Param.who];
  final String note = json[Param.note];
  final String roof = json[Param.roof];

  final decoratedTitle = WeightDecoratedText();

  decoratedTitle.addSection(text: who);
  decoratedTitle.addSection(text: 'split an expense at', thin: true);
  decoratedTitle.addSection(text: roof);

  return PublicActivityData(
      title: decoratedTitle,
      description: note,
      iconReference: IconReference.piggyBank,
      type: PublicActivityType.expense,
      timestamp: 9012);
}

PublicActivityData _dataForTransfer(Map<String, Object> json) {
  final String payer = json[Param.payer];
  final String receiver = json[Param.receiver];
  final String roof = json[Param.roof];
  final String note = json[Param.note];

  final decoratedTitle = WeightDecoratedText();

  decoratedTitle.addSection(text: payer);
  decoratedTitle.addSection(text: 'paid', thin: true);
  decoratedTitle.addSection(text: receiver);
  decoratedTitle.addSection(text: 'at', thin: true);
  decoratedTitle.addSection(text: roof);

  return PublicActivityData(
      title: decoratedTitle,
      description: note,
      iconReference: IconReference.cashSack,
      type: PublicActivityType.transfer,
      timestamp: 122);
}

PublicActivityData _dataForLandlordTransfer(Map<String, Object> json) {
  final String who = json[Param.who];
  final String home = json[Param.home];
  final String name = json[Param.name];
  final String landlord = json[Param.landlord];
  final String note = json[Param.note];

  final decoratedTitle = WeightDecoratedText();

  decoratedTitle.addSection(text: who);
  decoratedTitle.addSection(text: 'at', thin: true);
  decoratedTitle.addSection(text: home);
  decoratedTitle.addSection(text: 'paid', thin: true);
  decoratedTitle.addSection(text: name);
  decoratedTitle.addSection(text: 'to', thin: true);
  decoratedTitle.addSection(text: landlord);

  return PublicActivityData(
      title: decoratedTitle,
      description: note,
      iconReference: IconReference.cashSack,
      type: PublicActivityType.landlordTransfer,
      timestamp: 201);
}

PublicActivityData _dataForMaintenance(Map<String, Object> json) {
  final String who = json[Param.who];
  final String home = json[Param.home];
  final String name = json[Param.name];
  final String note = json[Param.note];

  final decoratedTitle = WeightDecoratedText();

  decoratedTitle.addSection(text: who);
  decoratedTitle.addSection(text: 'resolved', thin: true);
  decoratedTitle.addSection(text: name);
  decoratedTitle.addSection(text: 'at', thin: true);
  decoratedTitle.addSection(text: home);

  return PublicActivityData(
      title: decoratedTitle,
      description: note,
      iconReference: IconReference.toolbox,
      type: PublicActivityType.maintenance,
      timestamp: 1901);
}
