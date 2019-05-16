import 'package:flutter/material.dart';

import 'key_value_row.dart';

mixin KeyValueRowBuilder {
  Widget buildKeyValueRow(
    BuildContext context, {
    String title,
    String value,
    TextStyle titleStyle,
    TextStyle valueStyle,
    bool hasBorder,
  }) {
    return KeyValueRow(
      title: title,
      value: value,
      titleStyle: titleStyle,
      valueStyle: valueStyle,
      hasBorder: hasBorder,
    );
  }
}