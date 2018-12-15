import 'dart:async';

import 'package:flutter/material.dart';
import 'package:roof/services/public/index.dart';
import 'package:roof/util/static_key.dart';
import 'package:roof/util/icon_path.dart';
import 'package:roof/util/decorated_text.dart';
import 'data/public_activity_data.dart';

import 'widgets/list.dart';

// Create a stateful widget
class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

// Create the state for our stateful widget
class _AuthState extends State<Auth> {
  List<PublicActivityData> data = [];

  _AuthState() {
    fetchData();
  }

  // Function to get the JSON data
  Future fetchData() async {
    // dynamically typed.
    Activity().request(pageSize: 50).then((response) {
      // Schedules a `build`
      setState(() {
        data = _formattedDataFromResponse(response);
      });
    }).catchError((err) {
      print('No bueno');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Roof'),
        ),
        body: AuthList(data: data));
  }

  List<PublicActivityData> _formattedDataFromResponse(
      Map<String, Object> response) {
    final List publicActivity = response[StaticKey.publicActivity];
    return publicActivity.map((obj) {
      var decoratedTitle = WeightDecoratedText();
      var description;
      switch (obj[StaticKey.activityType]) {
        case StaticKey.completion:
          decoratedTitle.addSection(text: obj[StaticKey.who]);
          decoratedTitle.addSection(text: 'completed', thin: true);
          decoratedTitle.addSection(text: obj[StaticKey.name]);
          decoratedTitle.addSection(text: 'at', thin: true);
          decoratedTitle.addSection(text: obj[StaticKey.roof]);
          description = obj[StaticKey.note];
          break;
        case StaticKey.expense:
          decoratedTitle.addSection(text: obj[StaticKey.who]);
          decoratedTitle.addSection(text: 'split an expense at', thin: true);
          decoratedTitle.addSection(text: obj[StaticKey.roof]);
          description = obj[StaticKey.note];
          break;
        case StaticKey.transfer:
          decoratedTitle.addSection(text: obj[StaticKey.payer]);
          decoratedTitle.addSection(text: 'paid', thin: true);
          decoratedTitle.addSection(text: obj[StaticKey.receiver]);
          decoratedTitle.addSection(text: 'at', thin: true);
          decoratedTitle.addSection(text: obj[StaticKey.roof]);
          description = obj[StaticKey.note];
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
          break;
        case StaticKey.maintenance:
          decoratedTitle.addSection(text: obj[StaticKey.who]);
          decoratedTitle.addSection(text: 'resolved', thin: true);
          decoratedTitle.addSection(text: obj[StaticKey.name]);
          decoratedTitle.addSection(text: 'at', thin: true);
          decoratedTitle.addSection(text: obj[StaticKey.home]);
          description = obj[StaticKey.note];
          break;
      }
      return PublicActivityData(
          title: decoratedTitle,
          description: description,
          iconPath: IconPath.cashSack);
    }).toList();
  }
}
