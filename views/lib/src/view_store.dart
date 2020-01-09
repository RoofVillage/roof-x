import 'package:views/src/utils/_load.dart';

mixin ViewStore<View> {
  String get address;
  View Function(Map<String, Object>) get viewFromMap;

  Future<View> read() async {
    return viewFromMap(
      await readViewData(address),
    );
  }
}
