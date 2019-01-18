import 'dart:async';

import './roofui_bloc_base.dart';
import './roofui_streamable_data.dart';

class RoofUIListBloc implements RoofUIBlocBase {
  //The list containing all items;
  List<RoofUIStreamableData> _list;

  //The stream responsible for communicating changes to the entire list;
  StreamController<List<RoofUIStreamableData>> _listController =
      StreamController<List<RoofUIStreamableData>>();

  //The stream responsible for communicating changes to items within the list;
  StreamController<RoofUIStreamableData> _updateController =
      StreamController<RoofUIStreamableData>.broadcast();

  //Set the lists first value.
  set initialList(List<RoofUIStreamableData> initialList) {
    if (_list != null) return;
    _list = initialList;
    _inList.add(_list);
  }

  Sink<List<RoofUIStreamableData>> get _inList => _listController.sink;
  Stream<List<RoofUIStreamableData>> get outList => _listController.stream;

  Sink<RoofUIStreamableData> get _inData => _updateController.sink;
  Stream<RoofUIStreamableData> get outData => _updateController.stream;

  RoofUIListBloc() {
    _init();
  }

  _init() async {
    await populateInitialList();
  }

  @override
  dispose() {
    _listController.close();
    _updateController.close();
  }

  ///Pass in the data that needs to be updated in the list.
  updateData(RoofUIStreamableData data) {
    final oldDataIndex = _list.indexWhere((item) => item.id == data.id);
    if (oldDataIndex == -1) return;

    _list.replaceRange(oldDataIndex, oldDataIndex + 1, [data]);
    _inData.add(data);
  }

  Future populateInitialList() async {
    initialList = [];
  }
}
