import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:theme/index.dart';

import 'package:thread_components/index.dart';

class Sandbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    action() {}

    List<Widget> activityItems = [];

    Widget comment1 = RoofActivityComment(
        creator: "Boby", timestamp: "10pm", note: "Yo just doin chores yo");

    Widget event1 = RoofActivityEvent(
      title: "Stu cleaned the dog",
      note: "Super clean now!",
      timestamp: "2:30am",
    );

    activityItems.add(comment1);
    activityItems.add(event1);
    activityItems.add(comment1);
    activityItems.add(event1);
    activityItems.add(comment1);
    activityItems.add(event1);
    activityItems.add(comment1);

    return RoofTheme(RoofThemeOption.light,
        child: MaterialApp(
            title: 'Roof',
            theme: ThemeData(fontFamily: 'Azo'),
            home: Scaffold(
                body: RoofThread(
                    threadActivityItems: activityItems,
                    threadTitle: "Gucci thred",
                    threadAction: action,
                    threadActionIconReference: IconReference.piggyBank,
                    threadActionTitle: "Pay"))));
  }
}
