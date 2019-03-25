import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:table_artboard_mixin/index.dart';
import 'package:icon_library/index.dart';
import 'package:decorated_text/index.dart';
import 'package:full_screen_artboard_templates/index.dart';
import 'package:navigation_components/index.dart';
import 'package:sorting/index.dart';
import 'package:app_data/index.dart';
import 'package:service/index.dart';

import 'sign_up.dart';

enum Section {
  completions,
  expenses,
  transfers,
  landlordTransfers,
  maintenance
}

class PublicActivityArtboard extends FullLogoTableFullScreenArtboard {
  final _showFloatingArtboardButton = RoofIconNavButton(
      iconReference: IconReference.addNav,
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
  List<RoofNavButton> get actionButtons =>
      [_popButton, _showFloatingArtboardButton, _showFullScreenArtboardButton];

  List<StreamableTableSectionData> get sectionData {
    final completionsSectionData =
        StreamableTableSectionData<CellAData>.withTitle("Completions",
            criteria: (data) =>
                data.section == Section.values.indexOf(Section.completions),
            sort: Sort.revCron);

    final expenseSectionData = StreamableTableSectionData<CellAData>.withTitle(
        "Expenses",
        criteria: (data) =>
            data.section == Section.values.indexOf(Section.expenses),
        sort: Sort.revCron);

    final transferSectionData = StreamableTableSectionData<CellAData>.withTitle(
        "Transfers",
        criteria: (data) =>
            data.section == Section.values.indexOf(Section.transfers),
        sort: Sort.revCron);

    final landlordTransfersSectionData =
        StreamableTableSectionData<CellAData>.withTitle("Landlord Transfers",
            criteria: (data) =>
                data.section ==
                Section.values.indexOf(Section.landlordTransfers),
            sort: Sort.revCron);

    final maintenanceSectionData =
        StreamableTableSectionData<CellAData>.withTitle("Maintenance",
            criteria: (data) =>
                data.section == Section.values.indexOf(Section.maintenance),
            sort: Sort.revCron);

    return [
      completionsSectionData,
      expenseSectionData,
      transferSectionData,
      landlordTransfersSectionData,
      maintenanceSectionData
    ];
  }

  @override
  Future<List<CellAData>> get loadRowData async {
    return [];
    // //Format it the activity into streamable data on different thread.
    // final response = await PublicActivity().get(pageSize: 50);

    // final rowData = await compute<String, List<CellAData>>(
    //     _streamableDataFromResponse, response);

    // return rowData;
  }
}

List<CellAData> _streamableDataFromResponse(String response) {
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

CellAData _dataForCompletion(Map<String, Object> json) {
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

  return CellAData(
      title: decoratedTitle,
      description: note,
      iconReference: IconReference.complete,
      section: Section.values.indexOf(Section.completions),
      timestamp: 12221);
}

CellAData _dataForExpense(Map<String, Object> json) {
  final String who = json[Param.who];
  final String note = json[Param.note];
  final String roof = json[Param.roof];

  final decoratedTitle = WeightDecoratedText();

  decoratedTitle.addSection(text: who);
  decoratedTitle.addSection(text: 'split an expense at', thin: true);
  decoratedTitle.addSection(text: roof);

  return CellAData(
      title: decoratedTitle,
      description: note,
      iconReference: IconReference.piggyBank,
      section: Section.values.indexOf(Section.expenses),
      timestamp: 9012);
}

CellAData _dataForTransfer(Map<String, Object> json) {
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

  return CellAData(
      title: decoratedTitle,
      description: note,
      iconReference: IconReference.cashSack,
      section: Section.values.indexOf(Section.transfers),
      timestamp: 122);
}

CellAData _dataForLandlordTransfer(Map<String, Object> json) {
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

  return CellAData(
      title: decoratedTitle,
      description: note,
      iconReference: IconReference.cashSack,
      section: Section.values.indexOf(Section.landlordTransfers),
      timestamp: 201);
}

CellAData _dataForMaintenance(Map<String, Object> json) {
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

  return CellAData(
      title: decoratedTitle,
      description: note,
      iconReference: IconReference.toolbox,
      section: Section.values.indexOf(Section.maintenance),
      timestamp: 1901);
}
