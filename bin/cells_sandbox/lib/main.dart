import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:table_builder/index.dart';
import 'package:icon_library/index.dart';
import 'package:decorated_text/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:key_value_builder/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoofTheme(
      RoofThemeOption.dark,
      child: MaterialApp(
        title: 'Cells sandbox',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: CellsSandbox(),
        ),
      ),
    );
  }
}

class CellsSandbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final cellATitle = WeightDecoratedText();
    cellATitle.addSection(text: "Here's a");
    cellATitle.addSection(text: "thin part", thin: true);
    cellATitle.addSection(text: "title");

    final activityCell = RoofActivityCell(
      title: cellATitle,
      note: "Note note  note not enot enote note neontoe tnon entoent",
      iconReference: IconReference.cashSack,
    );

    final commentCell = RoofThreadCommentCell(
      creator: "Yung jo",
      timestamp: 42069,
      note:
          "Blaze it bitches Blaze it bitches Blaze it bitches Blaze it bitches Blaze it bitches Blaze it bitches Blaze it bitches Blaze it bitches",
    );

    final eventCell = RoofThreadEventCell(
      timestamp: 696969420,
      title: "Event title",
      note: "Did an event here's a note bishhh",
      iconReference: IconReference.livingRoom,
      details: [
        KeyValueData(
          title: "Permission to enter",
          value: "Fuck yea",
        ),
        KeyValueData(
          title: "Another detail",
          value: "Detail value",
        ),
        KeyValueData(
          title: "Another detail 222",
          value: "Detail value 222",
        ),
        KeyValueData(
          title: "more shit",
          value:
              "Detail value 222 asdf asdf asdfasdf alkjlkj asdfasdf alkjlkj asdfasdf alkjlkj",
        )
      ],
    );

    final emptyEventCell = RoofThreadEventCell(
      title: "Jo did a chore",
      timestamp: 121212,
    );

    final standardThreadCellSecondaryText = WeightDecoratedText()
      ..addSection(text: "Here's a")
      ..addSection(text: "thin part", thin: true)
      ..addSection(text: "title");

    final standardThreadCell = RoofStandardThreadCell(
      title: "Feed baby shark",
      secondaryText: standardThreadCellSecondaryText,
      iconReference: IconReference.thread,
      timestamp: 7843879,
    );

    final overdueThreadCell = RoofOverdueThreadCell(
      title: "Feed baby shark overdue",
      secondaryText: standardThreadCellSecondaryText,
      iconReference: IconReference.thread,
      timestamp: 7843879,
    );

    final dueSoonThreadCell = RoofDueSoonThreadCell(
      title: "Feed baby shark due soon",
      secondaryText: standardThreadCellSecondaryText,
      iconReference: IconReference.thread,
      timestamp: 7843879,
    );

    final noSecondaryThreadCell = RoofStandardThreadCell(
      title: "Feed baby shark is alone",
      iconReference: IconReference.thread,
      timestamp: 7843879,
    );

    return Scaffold(
      backgroundColor: theme.color.background.brand,
      body: ListView(
        children: [
          standardThreadCell,
          dueSoonThreadCell,
          overdueThreadCell,
          noSecondaryThreadCell,
          activityCell,
          activityCell,
          activityCell,
          commentCell,
          commentCell,
          commentCell,
          emptyEventCell,
          emptyEventCell,
          eventCell,
          eventCell,
          eventCell,
        ],
      ),
    );
  }
}
