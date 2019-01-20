import 'package:flutter/material.dart';

import 'package:roofui_kit/stream/roofui_streamable_data.dart';

abstract class RList<S extends RoofUIStreamableData> {
  Widget buildRow({S data, int rowIndex, int sectionIndex}) {
    return Container();
  }

  Widget buildItem({S data, int sectionIndex}) {
    return Container();
  }
}
