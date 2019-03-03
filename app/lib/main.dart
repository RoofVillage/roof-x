import 'package:flutter/material.dart';
import 'package:stream/index.dart';
import 'package:theme/index.dart';

import 'src/_bloc.dart';
import 'src/_widget.dart';

import 'package:form_components/index.dart';

void main() {
  runApp(_Roof());
}

class _Roof extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final testField = RoofDateField(
        fieldName: "Date field",
        placeholder: "03/20/19",
        onChanged: (String val) => print(val));
    return RoofTheme(RoofThemeOption.dark,
        child: MaterialApp(
            title: 'Roof',
            theme: ThemeData(fontFamily: 'azo'),
            // home: BlocProvider(bloc: AppBloc(), child: RootWidget()),
            home: Scaffold(
                backgroundColor: Colors.pink,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(40),
                  child: Container(),
                ),
                body: Column(children: <Widget>[
                  // Text("test")
                  testField
                ]))));
  }
}
