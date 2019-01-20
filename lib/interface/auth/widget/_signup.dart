import 'package:flutter/material.dart';

import 'package:roofui_kit/form/roofui_form.dart';
import 'package:roofui_kit/form/data/roofui_form_field_data.dart';

import '../bloc/_signup_bloc.dart';

import './../../widget/form.dart';

class SignUp extends StatelessWidget with RForm<RoofUIFormFieldData> {
  Widget build(BuildContext context) {
    return RoofUIForm<SignupBloc, RoofUIFormFieldData>(buildItem: buildItem);
  }
}

////temp
class RoofUIFormA extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<RoofUIFieldRow> fieldRows;
  final List<RoofUIFormButton> buttons;

  RoofUIFormA({this.title, this.subtitle, this.fieldRows, this.buttons});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class RoofUIFormData {
  String title;
  String subtitle;
  List<RoofUIFieldRow> fieldRows;
  List<RoofUIFormButton> buttons;
}

class RoofUIFieldRow {
  RoofUIField fields;
  RoofUIFieldRowLayoutType layoutType;
}

class RoofUIFormButton {}

class RoofUIField {}

enum RoofUIFieldRowLayoutType { even, weight }
