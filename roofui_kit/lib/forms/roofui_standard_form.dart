import 'package:flutter/material.dart';
import 'package:roofui_kit/util/roofui_form_styles.dart';
import 'package:roofui_kit/forms/widgets/index.dart';
import 'package:roofui_kit/fields/text/index.dart';
import 'package:roofui_kit/fields/textArea/index.dart';

class _StandardFormState extends State<StandardForm> {
  List<Map> fields;
  String titleText;
  String subtitleText;
  bool centered;
  bool autofocus;

  _StandardFormState(
      {Key key,
      this.fields,
      this.titleText,
      this.subtitleText,
      this.centered,
      this.autofocus});

  generateFieldWidgets({List<Map> fields, bool autofocus}) {
    List<Widget> fieldWidgets = [];
    for (var i = 0; i < fields.length; i++) {
      print(fields[i]);
      TextInputAction done = TextInputAction.done;
      TextInputAction next = TextInputAction.next;
      bool isLastField = i == fields.length - 1;
      bool isFirstField = i == 0;

      Map thisField = fields[i];
      Widget fieldWidget;
      switch (thisField["type"]) {
        case ("text"):
          fieldWidget = RoofUITextField(
              fieldNameText: thisField["fieldNameText"] ?? null,
              placeholderText: thisField["placeholderText"] ?? null,
              initialValueText: thisField["initialValueText"] ?? null,
              textInputAction: isLastField ? done : next,
              autofocus: isFirstField && autofocus ? true : false);
          break;
        case ("password"):
          fieldWidget = RoofUITextField(
              fieldNameText: thisField["fieldNameText"] ?? null,
              placeholderText: thisField["placeholderText"] ?? "••••••••",
              initialValueText: thisField["initialValueText"] ?? null,
              textInputAction: isLastField ? done : next,
              isPassword: true,
              autofocus: isFirstField && autofocus ? true : false);
          break;
        case ("textArea"):
          fieldWidget = RoofUITextArea(
              fieldNameText: thisField["fieldNameText"] ?? null,
              placeholderText: thisField["placeholderText"] ?? null,
              initialValueText: thisField["initialValueText"] ?? null,
              textInputAction: isLastField ? done : next,
              autofocus: isFirstField && autofocus ? true : false);
          break;
      }
      fieldWidgets.add(fieldWidget);
    }
    return fieldWidgets;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> headerObjects = [];

    Widget title = FormHeader.smallTitle(titleText);
    Widget subtitle = FormHeader.subtitle(subtitleText);
    if (titleText != null) headerObjects.add(title);
    if (subtitleText != null) headerObjects.add(subtitle);

    Widget header = Container(
        margin: FormStyle.formHeaderMargin(),
        child: Column(children: headerObjects));

    List<Widget> formObjects = [];
    if (headerObjects.length > 0) formObjects.add(header);

    List<Widget> fieldWidgets =
        generateFieldWidgets(fields: fields, autofocus: autofocus);

    for (Widget fieldWidget in fieldWidgets) {
      formObjects.add(fieldWidget);
    }

    return Form(
        child: Padding(
            padding: FormStyle.formMargin(),
            child: Column(
              crossAxisAlignment: centered
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: formObjects,
            )));
  }
}

class StandardForm extends StatefulWidget {
  final List<Map> fields;
  final String titleText;
  final String subtitleText;
  final bool centered;
  final bool autofocus;

  StandardForm(
      {Key key,
      this.fields,
      this.titleText,
      this.subtitleText,
      this.centered = false,
      this.autofocus = false});

  @override
  _StandardFormState createState() => _StandardFormState(
      fields: fields,
      titleText: titleText,
      subtitleText: subtitleText,
      centered: centered,
      autofocus: autofocus);
}
