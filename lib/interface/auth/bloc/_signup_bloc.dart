import 'package:roofui_kit/stream/roofui_streamable_data.dart';
import 'package:roofui_kit/stream/roofui_form_bloc.dart';

import '../data/_name_field_data.dart';

class SignupBloc extends RoofUIFormBloc {
  @override
  String get title => "Signup";

  @override
  String get subtitle => "This is the subtitle";

  @override
  List<FormButtonData> get buttons => [
        FormButtonData(),
        FormButtonData(),
      ];

  final nameField = NameFieldData(title: "booty");
  /*...*/

  SignupBloc() {
    _toggleShowing();
  }

  _toggleShowing() {
    nameField.hidden = !nameField.hidden;
    update(nameField);
  }

  @override
  Future<List<RoofUIStreamableData>> createList() async {
    return [
      nameField,
      FieldRowData(fields: [nameField])
    ];
  }
}
