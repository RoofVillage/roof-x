import 'package:views/src/utils/_load.dart';
import 'package:views/src/view_model.dart';

abstract class View<T extends ViewModel> {
  String get address;
  ViewModel get model;

  Future<T> load() async {
    return model.fromMap(
      await loadViewData(address),
    );
  }
}
