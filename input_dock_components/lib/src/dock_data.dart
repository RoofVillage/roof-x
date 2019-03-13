class DockSubmitData {
  String _text;
  List<String> _files = [];

  addFile(String file) {
    this._files.add(file);
  }

  removeFile(String file) {
    this._files.remove(file);
  }

  setText(String text) {
    this._text = text;
  }

  getText() {
    return _text;
  }

  getFiles() {
    return _files;
  }
}

typedef void DockDataCallback({DockSubmitData data});
