import 'package:form/index.dart';
import 'package:form_vertical_floating_artboard_template/index.dart';

mixin MetaFormArtboardBuilder<T> on FormVerticalFloatingArtboard<T> {
  Future<List<StreamableFormFieldData>> get fieldsData;
  T Function(List<StreamableFormFieldData>) get valueFromFieldsData;
  String get title;
  String get submitButtonText;
  void Function() get validateForm;
}
