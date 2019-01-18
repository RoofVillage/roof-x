import 'dart:async';

import 'package:roofui_kit/util/roofui_decorated_text.dart';

import 'package:roofui_kit/stream/roofui_list_bloc.dart';

import 'package:roof/service/public/activity.dart';
import 'package:roof/util/static_key.dart';
import 'package:roof/util/icon_map.dart';

import '../data/_public_activity_data.dart';

class AuthBloc extends RoofUIListBloc {
  @override
  Future populateInitialList() async {
    final response = await Activity().request(pageSize: 20);
    final formattedData = _formattedDataFromResponse(response);
    initialList = formattedData;
  }

  List<PublicActivityData> _formattedDataFromResponse(
      Map<String, Object> response) {
    final List publicActivity = response[StaticKey.publicActivity];

    return publicActivity.map((json) {
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
        iconReference: StandardizedIconMap.action);
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
        iconReference: StandardizedIconMap.balances);
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
        iconReference: StandardizedIconMap.cashSack);
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
        iconReference: StandardizedIconMap.cashSack);
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
        iconReference: StandardizedIconMap.action);
  }
}
