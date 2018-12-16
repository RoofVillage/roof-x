import 'dart:async';

import 'package:roof/services/public/index.dart';
import 'package:roof/util/static_key.dart';
import 'package:flutter/material.dart';
import 'package:roofui_kit/cell/a/index.dart';
import 'package:roofui_kit/util/roofui_decorated_text.dart';
import 'package:roof/util/icon_map.dart';

import '../data/public_activity_data.dart';

class AuthList extends StatefulWidget {
  @override
  _AuthListState createState() => _AuthListState();
}

class _AuthListState extends State<AuthList> {
  List<PublicActivityData> _data = [];

  _AuthListState() {
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int index) {
          final dataItem = _data[index];
          return RoofUICellA(
              titleText: dataItem.title,
              detailText: dataItem.description,
              iconReference: dataItem.iconReference);
        });
  }

  // Function to get the JSON data
  Future fetchData() async {
    // dynamically typed.
    Activity().request(pageSize: 50).then((response) {
      // Schedules a `build`
      setState(() {
        _data = _formattedDataFromResponse(response);
      });
    }).catchError((err) {
      print('No bueno');
    });
  }

  List<PublicActivityData> _formattedDataFromResponse(
      Map<String, Object> response) {
    final List publicActivity = response[StaticKey.publicActivity];
    return publicActivity.map((obj) {
      var decoratedTitle = WeightDecoratedText();
      var description;
      var iconReference;
      switch (obj[StaticKey.activityType]) {
        case StaticKey.completion:
          decoratedTitle.addSection(text: obj[StaticKey.who]);
          decoratedTitle.addSection(text: 'completed', thin: true);
          decoratedTitle.addSection(text: obj[StaticKey.name]);
          decoratedTitle.addSection(text: 'at', thin: true);
          decoratedTitle.addSection(text: obj[StaticKey.roof]);
          description = obj[StaticKey.note];
          iconReference = StandardizedIconMap.action;
          break;
        case StaticKey.expense:
          decoratedTitle.addSection(text: obj[StaticKey.who]);
          decoratedTitle.addSection(text: 'split an expense at', thin: true);
          decoratedTitle.addSection(text: obj[StaticKey.roof]);
          description = obj[StaticKey.note];
          iconReference = StandardizedIconMap.balances;
          break;
        case StaticKey.transfer:
          decoratedTitle.addSection(text: obj[StaticKey.payer]);
          decoratedTitle.addSection(text: 'paid', thin: true);
          decoratedTitle.addSection(text: obj[StaticKey.receiver]);
          decoratedTitle.addSection(text: 'at', thin: true);
          decoratedTitle.addSection(text: obj[StaticKey.roof]);
          description = obj[StaticKey.note];
          iconReference = StandardizedIconMap.cashSack;
          break;
        case StaticKey.landlordTransfer:
          decoratedTitle.addSection(text: obj[StaticKey.who]);
          decoratedTitle.addSection(text: 'at', thin: true);
          decoratedTitle.addSection(text: obj[StaticKey.home]);
          decoratedTitle.addSection(text: 'paid', thin: true);
          decoratedTitle.addSection(text: obj[StaticKey.name]);
          decoratedTitle.addSection(text: 'to', thin: true);
          decoratedTitle.addSection(text: obj[StaticKey.landlord]);
          description = obj[StaticKey.home];
          iconReference = StandardizedIconMap.cashSack;
          break;
        case StaticKey.maintenance:
          decoratedTitle.addSection(text: obj[StaticKey.who]);
          decoratedTitle.addSection(text: 'resolved', thin: true);
          decoratedTitle.addSection(text: obj[StaticKey.name]);
          decoratedTitle.addSection(text: 'at', thin: true);
          decoratedTitle.addSection(text: obj[StaticKey.home]);
          description = obj[StaticKey.note];
          iconReference = StandardizedIconMap.action;
          break;
      }
      return PublicActivityData(
          title: decoratedTitle,
          description: description,
          iconReference: iconReference);
    }).toList();
  }
}
