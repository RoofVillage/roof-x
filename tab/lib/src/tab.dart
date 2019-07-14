import 'package:flutter/material.dart';
import 'package:standard_icon_library/index.dart';

import 'tab_dock_data.dart';

class RoofTab {
  final String title;
  final StandardIcon icon;
  final Widget view;
  final TabDockData dockData;

  RoofTab({this.title, this.icon, this.view, this.dockData});
}
