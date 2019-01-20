import 'package:flutter/material.dart';

import './roofui_list_bloc.dart';

import './roofui_streamable_data.dart';

import './../form/data/roofui_form_field_data.dart';

class RoofUIFormBloc extends RoofUIListBloc {
  String title;
  String subtitle;
  List<ButtonData> buttons;

  TitleData _titleData;
  SubtitleData _subtitleData;

  RoofUIFormBloc() {
    _init();
  }

  _init() async {
    List<RoofUIStreamableData> initialList = [];

    if (title != null) {
      _titleData = TitleData(title);
      initialList.add(_titleData);
    }

    if (subtitle != null) {
      _subtitleData = SubtitleData(subtitle);
      initialList.add(_subtitleData);
    }

    if (buttons != null) {
      initialList.addAll(buttons);
    }

    List<RoofUIStreamableData> fields = await createFields();

    initialList.addAll(fields);

    this.initialList = initialList;
  }

  Future createFields() {
    return createList();
  }
}

class TitleData extends RoofUIFormFieldData {
  final String value;

  TitleData(this.value) : super(title: value);
}

class SubtitleData extends RoofUIFormFieldData {
  final String value;

  SubtitleData(this.value) : super(title: value);
}

class ButtonData extends RoofUIFormFieldData {
  String title;
  ButtonStyle style;

  ButtonData({@required this.title, @required this.style});
}

class ButtonStyle {
  Color color;

  ButtonStyle({this.color});
}
