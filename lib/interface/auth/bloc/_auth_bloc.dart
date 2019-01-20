import 'dart:async';

import 'package:roofui_kit/util/roofui_decorated_text.dart';

import 'package:roofui_kit/stream/roofui_table_bloc.dart';
import 'package:roofui_kit/stream/roofui_streamable_data.dart';

import 'package:roof/service/public/activity.dart';
import 'package:roof/util/static_key.dart';
import 'package:roof/util/icon_map.dart';

import '../data/_public_activity_data.dart';
import '../data/_sections.dart';

class AuthBloc extends RoofUITableBloc {
  @override
  Future<RoofUIStreamableTableData> createTableData() async {
    //Grab public activity from the server.
    final response = await Activity().request(pageSize: 50);

    //Format it the activity into streamable data.
    final streamableData = _streamableDataFromResponse(response);

    ///Make table data;
    final tableData = RoofUIStreamableTableData(sectionData: [
      sectionDataMap[Section.completions],
      sectionDataMap[Section.expenses],
      sectionDataMap[Section.transfers],
      sectionDataMap[Section.landlordTransfers],
      sectionDataMap[Section.maintenance]
    ], rowData: streamableData);

    return tableData;
  }

  List<PublicActivityData> _streamableDataFromResponse(
      Map<String, Object> response) {
    final List publicActivity = response[StaticKey.publicActivity];

    final data = publicActivity.map((json) {
      switch (json[StaticKey.activityType]) {
        case StaticKey.completion:
          return _dataForCompletion(json);
        case StaticKey.expense:
          return _dataForExpense(json);
        case StaticKey.transfer:
          return _dataForTransfer(json);
        case StaticKey.landlordTransfer:
          return _dataForLandlordTransfer(json);
        case StaticKey.maintenance:
          return _dataForMaintenance(json);
      }
    }).toList();

    return data;
  }

  PublicActivityData _dataForCompletion(Map<String, Object> json) {
    final String who = json[StaticKey.who];
    final String name = json[StaticKey.name];
    final String roof = json[StaticKey.roof];
    final String note = json[StaticKey.note];

    RoofUIWeightDecoratedText decoratedTitle = RoofUIWeightDecoratedText();

    decoratedTitle.addSection(text: who);
    decoratedTitle.addSection(text: 'completed', thin: true);
    decoratedTitle.addSection(text: name);
    decoratedTitle.addSection(text: 'at', thin: true);
    decoratedTitle.addSection(text: roof);

    return PublicActivityData(
        title: decoratedTitle,
        description: note,
        assetReference: StandardizedIconMap.action,
        type: PublicActivityType.completion);
  }

  PublicActivityData _dataForExpense(Map<String, Object> json) {
    final String who = json[StaticKey.who];
    final String note = json[StaticKey.note];
    final String roof = json[StaticKey.roof];

    RoofUIWeightDecoratedText decoratedTitle = RoofUIWeightDecoratedText();

    decoratedTitle.addSection(text: who);
    decoratedTitle.addSection(text: 'split an expense at', thin: true);
    decoratedTitle.addSection(text: roof);

    return PublicActivityData(
        title: decoratedTitle,
        description: note,
        assetReference: StandardizedIconMap.balances,
        type: PublicActivityType.expense);
  }

  PublicActivityData _dataForTransfer(Map<String, Object> json) {
    final String payer = json[StaticKey.payer];
    final String receiver = json[StaticKey.receiver];
    final String roof = json[StaticKey.roof];
    final String note = json[StaticKey.note];

    RoofUIWeightDecoratedText decoratedTitle = RoofUIWeightDecoratedText();

    decoratedTitle.addSection(text: payer);
    decoratedTitle.addSection(text: 'paid', thin: true);
    decoratedTitle.addSection(text: receiver);
    decoratedTitle.addSection(text: 'at', thin: true);
    decoratedTitle.addSection(text: roof);

    return PublicActivityData(
        title: decoratedTitle,
        description: note,
        assetReference: StandardizedIconMap.cashSack,
        type: PublicActivityType.transfer);
  }

  PublicActivityData _dataForLandlordTransfer(Map<String, Object> json) {
    final String who = json[StaticKey.who];
    final String home = json[StaticKey.home];
    final String name = json[StaticKey.name];
    final String landlord = json[StaticKey.landlord];
    final String note = json[StaticKey.note];

    RoofUIWeightDecoratedText decoratedTitle = RoofUIWeightDecoratedText();

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
        assetReference: StandardizedIconMap.cashSack,
        type: PublicActivityType.landlordTransfer);
  }

  PublicActivityData _dataForMaintenance(Map<String, Object> json) {
    final String who = json[StaticKey.who];
    final String home = json[StaticKey.home];
    final String name = json[StaticKey.name];
    final String note = json[StaticKey.note];

    RoofUIWeightDecoratedText decoratedTitle = RoofUIWeightDecoratedText();

    decoratedTitle.addSection(text: who);
    decoratedTitle.addSection(text: 'resolved', thin: true);
    decoratedTitle.addSection(text: name);
    decoratedTitle.addSection(text: 'at', thin: true);
    decoratedTitle.addSection(text: home);

    return PublicActivityData(
        title: decoratedTitle,
        description: note,
        assetReference: StandardizedIconMap.action,
        type: PublicActivityType.maintenance);
  }
}
