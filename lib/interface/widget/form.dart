import 'package:flutter/material.dart';

import "package:roofui_kit/form/data/roofui_text_area_data.dart";
import "package:roofui_kit/form/data/roofui_text_field_data.dart";
import 'package:roofui_kit/form/data/roofui_form_title_data.dart';
import 'package:roofui_kit/form/data/roofui_form_field_data.dart';
import "package:roofui_kit/form/field/roofui_text_area.dart";
import "package:roofui_kit/form/field/roofui_text_field.dart";
import "package:roofui_kit/form/field/roofui_form_title.dart";

abstract class RForm<S extends RoofUIFormFieldData> {
  Widget buildItem({S data, int row, int section}) {
    if (data is RoofUIFormTitleData) {
      return buildFormTitle(data: data);
    } else if (data is RoofUITextFieldData) {
      return buildTextField(data: data);
    } else if (data is RoofUITextAreaData) {
      return buildTextArea(data: data);
    }
    return null;
  }

  RoofUIFormTitle buildFormTitle({RoofUIFormTitleData data}) {
    return RoofUIFormTitle();
  }

  RoofUITextField buildTextField({RoofUITextFieldData data}) {
    return RoofUITextField();
  }

  RoofUITextArea buildTextArea({RoofUITextAreaData data}) {
    return RoofUITextArea();
  }
}
