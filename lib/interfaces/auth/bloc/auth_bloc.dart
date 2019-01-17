import 'dart:async';
import 'package:roof/util/bloc_provider.dart';
import 'package:roofui_kit/util/roofui_decorated_text.dart';
import 'package:roofui_kit/util/roofui_icon_reference.dart';

import '../data/public_activity_data.dart';

class AuthBloc implements BlocBase {
  PublicActivityData _data;

  // Streams to handle the user
  StreamController<PublicActivityData> _publicActivityController =
      StreamController<PublicActivityData>();
  Sink<PublicActivityData> get _inData => _publicActivityController.sink;
  Stream<PublicActivityData> get outData => _publicActivityController.stream;

  AuthBloc() {
    _init();
  }

  _init() async {
    _data = PublicActivityData(
        title: WeightDecoratedText(text: "Yomamam"),
        description: "yup",
        iconReference: StandardizedIconReference(path: "images/cash_sack.svg"));
    _inData.add(_data);
  }

  @override
  dispose() {
    _publicActivityController.close();
  }

  updateData(PublicActivityData data) {
    _data = data;
    _inData.add(_data);
  }
}
