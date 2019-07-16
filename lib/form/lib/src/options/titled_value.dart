import 'package:stream/index.dart';

class FormTitledValue<T> extends StreamableData {
  String title;
  T value;

  FormTitledValue({this.title, this.value}) : super();
}
