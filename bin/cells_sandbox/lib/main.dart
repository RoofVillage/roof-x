
import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:table_builder/index.dart';
import 'package:icon_library/index.dart';
import 'package:decorated_text/index.dart';
import 'package:key_value_builder/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoofTheme(
      RoofThemeOption.light,
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

class CellsSandbox extends StatelessWidget with KeyValueBuilder {
  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final cellATitle = WeightDecoratedText();
    cellATitle.addSection(text: "Evan");
    cellATitle.addSection(text: "bought you", thin: true);
    cellATitle.addSection(text: "Tide Pods");
    cellATitle.addSection(text: "for", thin: true);
    cellATitle.addSection(text: "\$17.50");

    final activityCell = RoofActivityCell(
      title: cellATitle,
      note: "Young and McIntosh have even been known to get off stage and join the crowd to mosh, while the music keeps playing",
      iconReference: IconReference.cashSack,
      timestamp: 1558229172,
    );

    final commentCell = RoofThreadCommentCell(
      creator: "Yung jo",
      timestamp: 1558229172,
      note:
          "The duo came second in a college band competition, strangely listed under 'acoustic rock', but still managed to make an impact which scored them a couple of local shows in late 2005. From there Cal and Simon wrote a handful of songs in the space of two weeks and released a home brew EP, which gained them a special mention on Triple J and secured TSOMM a place on various radio stations around Australia.",
    );

    final eventCell = RoofThreadEventCell(
      timestamp: 1558229172,
      title: "Event title",
      note: "Did an event here's a note bishhh",
      iconReference: IconReference.livingRoom,
      details: [
        buildKeyValue(
          context,
          title: "Permission to enter",
          value: "Fuck yea",
        ),
        buildKeyValue(
          context,
          title: "Another detail",
          value: "Detail value",
        ),
        buildKeyValue(
          context,
          title: "Another detail 222",
          value: "Detail value 222",
        ),
        buildKeyValue(
          context,
          title: "more shit",
          value:
              "Detail value 222 asdf asdf asdfasdf alkjlkj asdfasdf alkjlkj asdfasdf alkjlkj",
        )
      ],
    );

    final emptyEventCell = RoofThreadEventCell(
      title: "Jo did a chore",
      timestamp: 1558229172,
    );

    final standardThreadCellSecondaryText = WeightDecoratedText()
      ..addSection(text: "Assigned to", thin: true)
      ..addSection(text: "Evan");

    final standardThreadCell = RoofStandardThreadCell(
      title: "Feed baby shark",
      secondaryText: standardThreadCellSecondaryText,
      iconReference: IconReference.thread,
      timestamp: 1558229172,
      onTap: () => print("tap"),
    );

    final overdueThreadCell = RoofOverdueThreadCell(
      title: "Feed baby shark overdue",
      secondaryText: standardThreadCellSecondaryText,
      iconReference: IconReference.thread,
      timestamp: 1558229172,
      onTap: () => print("tap"),
    );

    final dueSoonThreadCell = RoofDueSoonThreadCell(
      title: "Feed baby shark due soon",
      secondaryText: standardThreadCellSecondaryText,
      iconReference: IconReference.thread,
      timestamp: 1558229172,
      onTap: () => print("tap"),
    );

    final noSecondaryThreadCell = RoofStandardThreadCell(
      title: "Feed baby shark is alone and real real long long long",
      iconReference: IconReference.thread,
      timestamp: 1558229172,
      onTap: () => print("tap"),
    );

    final segueBar = RoofSegueBar(
      title: "Balances",
      iconReference: IconReference.piggyBank,
      auxiliaryText: "-\$14.50",
      onTap: () => print("tap"),
    );

    return Scaffold(
      backgroundColor: theme.color.background.brand,
      body: ListView(
        children: [
          standardThreadCell,
          dueSoonThreadCell,
          overdueThreadCell,
          segueBar,
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
