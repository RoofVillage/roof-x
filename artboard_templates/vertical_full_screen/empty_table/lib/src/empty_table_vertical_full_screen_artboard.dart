import 'package:flutter/material.dart';
import 'package:table_builder/index.dart';
import 'package:artboard/index.dart';
import 'package:vertical_full_screen_artboard_scaffold/index.dart';

abstract class EmptyTableVerticalFullScreenArtboard extends StatefulWidget
    with VerticalFullScreenArtboard, Artboard, TableBuilder {
  @override
  Widget buildBody(BuildContext context) => buildTable(context);
}
