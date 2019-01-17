import 'dart:async';
import 'dart:math';

import 'package:roofui_kit/util/roofui_decorated_text.dart';

import 'package:roof/util/bloc_provider.dart';
import 'package:roof/services/public/index.dart';
import 'package:roof/util/static_key.dart';
import 'package:roof/util/icon_map.dart';

import '../data/public_activity_data.dart';

class AuthBloc implements BlocBase {
  List<PublicActivityData> _list;
  final random = new Random();

  StreamController<List<PublicActivityData>> _publicActivityController =
      StreamController<List<PublicActivityData>>();

  Sink<List<PublicActivityData>> get _inList => _publicActivityController.sink;
  Stream<List<PublicActivityData>> get outList =>
      _publicActivityController.stream;

  StreamController<PublicActivityData> _updateController =
      StreamController<PublicActivityData>.broadcast();

  Sink<PublicActivityData> get _inData => _updateController.sink;
  Stream<PublicActivityData> get outData => _updateController.stream;

  AuthBloc() {
    _init();
  }

  _init() async {
    await _populateInitialData();
    _startShuffler();
  }

  shuffleMe() {
    _shuffle();
  }

  _startShuffler() async {
    await Future.delayed(Duration(milliseconds: 100));
    _shuffle();
    _startShuffler();
  }

  _shuffle() {
    final random1 = random.nextInt(_list.length);
    final random2 = random.nextInt(_list.length);

    if (random1 == random2) return;

    final data1 = _list[random1];
    final data2 = _list[random2];

    final newData1 = PublicActivityData(
        id: data1.id,
        title: data2.title,
        description: data2.description,
        iconReference: data2.iconReference);

    final newData2 = PublicActivityData(
        id: data2.id,
        title: data1.title,
        description: data1.description,
        iconReference: data1.iconReference);

    updateData(newData1);
    updateData(newData2);
  }

  @override
  dispose() {
    _publicActivityController.close();
    _updateController.close();
  }

  void updateData(PublicActivityData data) {
    final oldDataIndex = _list.indexWhere((item) => item.id == data.id);
    if (oldDataIndex == -1) return;

    _list.replaceRange(oldDataIndex, oldDataIndex + 1, [data]);
    _inData.add(data);
  }

  Future _populateInitialData() async {
    final response = await Activity().request(pageSize: 20);
    final formattedData = _formattedDataFromResponse(response);
    _list = formattedData;
    _inList.add(_list);
  }

  List<PublicActivityData> _formattedDataFromResponse(
      Map<String, Object> response) {
    final List publicActivity = response[StaticKey.publicActivity];
    return publicActivity.map((obj) {
      var decoratedTitle = WeightDecoratedText();
      var description;
      var iconReference;
      var id = "";
      switch (obj[StaticKey.activityType]) {
        case StaticKey.completion:
          id += obj[StaticKey.who];
          id += obj[StaticKey.name];
          id += obj[StaticKey.roof];

          decoratedTitle.addSection(text: obj[StaticKey.who]);
          decoratedTitle.addSection(text: 'completed', thin: true);
          decoratedTitle.addSection(text: obj[StaticKey.name]);
          decoratedTitle.addSection(text: 'at', thin: true);
          decoratedTitle.addSection(text: obj[StaticKey.roof]);
          description = obj[StaticKey.note];
          iconReference = StandardizedIconMap.action;
          break;
        case StaticKey.expense:
          id += obj[StaticKey.who];
          id += obj[StaticKey.roof];

          decoratedTitle.addSection(text: obj[StaticKey.who]);
          decoratedTitle.addSection(text: 'split an expense at', thin: true);
          decoratedTitle.addSection(text: obj[StaticKey.roof]);
          description = obj[StaticKey.note];
          iconReference = StandardizedIconMap.balances;
          break;
        case StaticKey.transfer:
          id += obj[StaticKey.payer];
          id += obj[StaticKey.receiver];
          id += obj[StaticKey.roof];
          decoratedTitle.addSection(text: obj[StaticKey.payer]);
          decoratedTitle.addSection(text: 'paid', thin: true);
          decoratedTitle.addSection(text: obj[StaticKey.receiver]);
          decoratedTitle.addSection(text: 'at', thin: true);
          decoratedTitle.addSection(text: obj[StaticKey.roof]);
          description = obj[StaticKey.note];
          iconReference = StandardizedIconMap.cashSack;
          break;
        case StaticKey.landlordTransfer:
          id += obj[StaticKey.who];
          id += obj[StaticKey.home];
          id += obj[StaticKey.name];
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
          id += obj[StaticKey.who];
          id += obj[StaticKey.name];
          id += obj[StaticKey.home];
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
          id: id,
          title: decoratedTitle,
          description: description,
          iconReference: iconReference);
    }).toList();
  }
}
