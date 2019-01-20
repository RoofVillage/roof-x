import 'dart:async';

import './roofui_bloc_base.dart';
import './roofui_streamable_data.dart';

class RoofUIListBloc implements RoofUIBlocBase {
  //The list containing all items;
  List<RoofUIStreamableData> _list;

  //The stream responsible for communicating changes to the entire list;
  final _listController = StreamController<List<RoofUIStreamableData>>();

  //The stream responsible for communicating changes to items within the list;
  final _updateController = StreamController<RoofUIStreamableData>.broadcast();

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

  Future<List<RoofUIStreamableData>> createList() async {
    return [];
  }

  void updateData(RoofUIStreamableData data) {
    final dataIndex = _indexOfDataWithId(data.id);
    if (dataIndex == -1) return;

    _list.replaceRange(dataIndex, dataIndex + 1, [data]);
    _inData.add(data);
  }

  void insertData(RoofUIStreamableData data) {
    _list.add(data);
    _inData.add(data);
  }

  void removeData(RoofUIStreamableData data) {
    final dataIndex = _indexOfDataWithId(data.id);
    if (dataIndex == -1) return;

    _list.removeAt(dataIndex);
    data.hidden = true;
    _inData.add(data);
  }

  ///Pass in the data that needs to be updated in the list.
  void updateList(List<RoofUIStreamableData> list) {
    _list = list;
    _inList.add(list);
  }

  @override
  void dispose() {
    _listController.close();
    _updateController.close();
  }

  void _init() async {
    initialList = await createList();
  }

  int _indexOfDataWithId(String id) {
    final dataIndex = _list.indexWhere((item) => item.id == id);
    return dataIndex;
  }
}
