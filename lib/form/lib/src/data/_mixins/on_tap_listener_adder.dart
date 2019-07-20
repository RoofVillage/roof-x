mixin OnTapListenerAdder {
  Function get onTap => () {
        for (final listener in _onTapListeners) listener();
      };

  List<Function> _onTapListeners = [];

  void addOnTapListener(Function fn) {
    if (_onTapListeners.contains(fn)) return;
    _onTapListeners.add(fn);
  }
}
