class DockSubmitData {
  String text;
  List<String> files;

  DockSubmitData({this.text, this.files});
}

typedef void DockDataCallback({DockSubmitData data});
