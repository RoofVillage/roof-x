import 'package:flutter/material.dart';

import '_components/grid.dart';

mixin GridBuilder {
  Widget buildGrid(BuildContext context) {
    return Container(color: Colors.pink, width: 300, height: 200);
  }
}
