import 'package:stream/index.dart';

class FormLabeledValue<T> extends StreamableData {
  String label;
  T value;

  FormLabeledValue({this.label, this.value}) : super();
}
