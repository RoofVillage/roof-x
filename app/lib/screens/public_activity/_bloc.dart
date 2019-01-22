import 'dart:async';

import 'package:table/bloc.dart';

import 'package:decorated_text/index.dart';

import 'package:services/index.dart';
import 'package:icon_library/index.dart';
import 'package:app/utils/static_key.dart';

import 'data/index.dart';

class Bloc extends StreamTableBloc {
  @override
  Future<StreamableTableData> createTableData() async {
    //Grab public activity from the server.
    final response = await PublicActivity().request(pageSize: 50);

    //Format it the activity into streamable data.
    final streamableData = _streamableDataFromResponse(response);

    ///Make table data;
    final tableData = StreamableTableData(sectionData: [
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

    final decoratedTitle = WeightDecoratedText();

    decoratedTitle.addSection(text: who);
    decoratedTitle.addSection(text: 'completed', thin: true);
    decoratedTitle.addSection(text: name);
    decoratedTitle.addSection(text: 'at', thin: true);
    decoratedTitle.addSection(text: roof);

    return PublicActivityData(
        title: decoratedTitle,
        description: note,
        iconReference: IconReference.action,
        type: PublicActivityType.completion,
        timestamp: 12221);
  }

  PublicActivityData _dataForExpense(Map<String, Object> json) {
    final String who = json[StaticKey.who];
    final String note = json[StaticKey.note];
    final String roof = json[StaticKey.roof];

    final decoratedTitle = WeightDecoratedText();

    decoratedTitle.addSection(text: who);
    decoratedTitle.addSection(text: 'split an expense at', thin: true);
    decoratedTitle.addSection(text: roof);

    return PublicActivityData(
        title: decoratedTitle,
        description: note,
        iconReference: IconReference.balances,
        type: PublicActivityType.expense,
        timestamp: 9012);
  }

  PublicActivityData _dataForTransfer(Map<String, Object> json) {
    final String payer = json[StaticKey.payer];
    final String receiver = json[StaticKey.receiver];
    final String roof = json[StaticKey.roof];
    final String note = json[StaticKey.note];

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
    final String who = json[StaticKey.who];
    final String home = json[StaticKey.home];
    final String name = json[StaticKey.name];
    final String landlord = json[StaticKey.landlord];
    final String note = json[StaticKey.note];

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
    final String who = json[StaticKey.who];
    final String home = json[StaticKey.home];
    final String name = json[StaticKey.name];
    final String note = json[StaticKey.note];

    final decoratedTitle = WeightDecoratedText();

    decoratedTitle.addSection(text: who);
    decoratedTitle.addSection(text: 'resolved', thin: true);
    decoratedTitle.addSection(text: name);
    decoratedTitle.addSection(text: 'at', thin: true);
    decoratedTitle.addSection(text: home);

    return PublicActivityData(
        title: decoratedTitle,
        description: note,
        iconReference: IconReference.action,
        type: PublicActivityType.maintenance,
        timestamp: 1901);
  }
}
