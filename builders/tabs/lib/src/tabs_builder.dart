import 'package:flutter/material.dart';

import '_components/tabs.dart';

mixin TabsBuilder {
  Widget buildTab(BuildContext context) {
    return Container(color: Colors.pink, width: 300, height: 200);
  }
}
