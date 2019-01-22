import 'package:flutter/material.dart';

import './_delegate.dart';

class RoofTableSectionHeaderA extends SliverPersistentHeader {
  RoofTableSectionHeaderA({@required String title})
      : super(
            pinned: false,
            floating: false,
            delegate: RoofTableSectionHeaderADelegate(title: title));
}
