import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_builder/index.dart';
import 'package:form_body_builder/index.dart';
import 'package:navigator/index.dart';
import 'package:artboard/index.dart';
import 'package:date/index.dart';
import 'package:date_picker_builder/index.dart';
import 'package:date_picker_artboard/index.dart';
import 'package:button_builder/index.dart';
import 'package:vertical_floating_artboard_template_utils/index.dart';

abstract class FormVerticalFloatingArtboard<T> extends StatefulWidget
    with
        VerticalFloatingArtboard<T>,
        Artboard<T>,
        FormBuilder,
        FormBodyBuilder,
        PrimaryCenterButtonBuilder {
  @override
  State<StatefulWidget> createState() => _FormVerticalFloatingArtboardState();

  @override
  DatePickerBuilder buildDatePicker(BuildContext context,
      {@required Date selectedDate}) {
    return DatePickerVerticalFloatingArtboard(selectedDate: selectedDate);
  }

  @override
  Future<T> goTo<T>(
      {@required BuildContext context, @required Artboard<T> artboard}) async {
    return await ArtboardNavigator.of(context).goTo<T>(artboard);
  }

  @override
  void onFocusChanged(
      {@required BuildContext context, @required bool isInFocus}) {
    ArtboardNavigator.of(context).toggleNavButtonsHidden(isInFocus);
  }
}

class _FormVerticalFloatingArtboardState
    extends State<FormVerticalFloatingArtboard>
    with
        VerticalFloatingArtboardState<FormVerticalFloatingArtboard>,
        FormBodyBuilderState<FormVerticalFloatingArtboard>,
        FormBuilderState<FormVerticalFloatingArtboard> {
  @override
  Widget buildBody(BuildContext context) => buildForm(context);
}
