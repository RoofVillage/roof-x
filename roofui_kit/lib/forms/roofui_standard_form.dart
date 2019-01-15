import 'package:flutter/material.dart';
import 'package:roofui_kit/util/roofui_distance.dart';
import 'package:roofui_kit/forms/widgets/index.dart';

class StandardForm extends StatelessWidget {
  final List<Widget> fields;
  final String titleText;
  final String subtitleText;
  final bool centered;

  const StandardForm({Key key, this.fields, this.titleText, this.subtitleText, this.centered = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> headerObjects = [];

    Widget title = FormHeader.smallTitle(titleText);
    Widget subtitle = FormHeader.subtitle(subtitleText);
    if (titleText != null) headerObjects.add(title);
    if (subtitleText != null) headerObjects.add(subtitle);

    Widget header = Container(
      margin: EdgeInsets.fromLTRB(0, RoofUIDistance.c, 0, RoofUIDistance.c),
      child: Column(children: headerObjects)
    );

    List<Widget> formObjects = [];
    if (headerObjects.length > 0) formObjects.add(header);
    for (Widget field in fields) {
      formObjects.add(field);
    }

    return Form(
        child: Padding(
            padding: EdgeInsets.fromLTRB(RoofUIDistance.c, RoofUIDistance.b,
                RoofUIDistance.c, RoofUIDistance.b),
            child: Column(
              crossAxisAlignment: centered? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: formObjects,
            )));
  }
}
