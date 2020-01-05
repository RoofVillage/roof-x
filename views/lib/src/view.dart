import 'package:views/src/utils/_load.dart';
import 'package:views/src/view_model.dart';

abstract class View {
  String get address;
  ViewModel get model;

  Future<ViewModel> load() async {
    return model.fromMap(
      await loadViewData(address),
    );
  }
}
