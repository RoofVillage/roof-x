import 'dart:async';

import 'package:flutter/material.dart';
import 'package:button_builder/index.dart';
import 'package:typography/index.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';
import 'package:form_builder/index.dart';
import 'package:form_body_builder/index.dart';
import 'package:navigation/index.dart';
import 'package:artboard/index.dart';
import 'package:date/index.dart';
import 'package:date_picker_builder/index.dart';

import 'floating_artboard.dart';

import '_components/date_picker_floating_artboard.dart';

export 'package:form_builder/index.dart';

abstract class FormFloatingArtboard<T> extends StatefulWidget
    with
        Artboard<T>,
        FloatingArtboard<T>,
        FormBuilder,
        FormBodyBuilder,
        SubmitButtonBuilder {
  @override
  State<StatefulWidget> createState() => _FormFloatingArtboardState();

  DatePickerBuilder buildDatePicker(BuildContext context,
      {@required Date selectedDate}) {
    return DatePickerFloatingArtboard(selectedDate: selectedDate);
  }

  @override
  Future<T> goTo<T>(
      {@required BuildContext context, @required Artboard<T> artboard}) async {
    return await ArtboardNavigator.of(context).goTo<T>(artboard);
  }

  @override
  void onFocusChanged(
      {@required BuildContext context, @required bool isInFocus}) {
    ArtboardNavigator.of(context).toggleNavButtonsHidden(!isInFocus);
  }
}

class _FormFloatingArtboardState extends State<FormFloatingArtboard>
    with
        FormBodyBuilderState<FormFloatingArtboard>,
        FormBuilderState<FormFloatingArtboard>,
        FloatingArtboardState<FormFloatingArtboard> {
  final _headerStyle = RoofTypography.heading1;
  final _subtitleStyle = RoofTypography.bodyPrimary;

  final _bodyVerticalPadding = EdgeInsets.only(top: RoofDistance.d);
  final _buttonVerticalPadding = EdgeInsets.only(top: RoofDistance.d);

  @override
  Widget buildBody(BuildContext context) {
    final theme = RoofTheme.of(context);

    final headerColor = theme.color.text.brand;
    final subtitleColor = theme.color.text.secondary;
    final headerStyle = _headerStyle.textStyleWithColor(headerColor);
    final subtitleStyle = _subtitleStyle.textStyleWithColor(subtitleColor);

    final widgets = <Widget>[];

    if (widget.title != null) {
      widgets.add(Text(widget.title, style: headerStyle));
    }

    if (widget.subtitle != null) {
      widgets.add(Text(widget.subtitle, style: subtitleStyle));
    }

    widgets.add(
      Padding(padding: _bodyVerticalPadding, child: buildForm(context)),
    );

    if (!isFocused) {
      widgets
          .add(Padding(padding: _buttonVerticalPadding, child: submitButton));
    }

    return Column(children: widgets);
  }
}
