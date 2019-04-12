import 'package:flutter/material.dart';

import '_components/key_value.dart';

mixin KeyValueBuilder {
  Widget buildKeyValue(BuildContext context) {
    return Container(color: Colors.pink, width: 300, height: 200);
  }
}
