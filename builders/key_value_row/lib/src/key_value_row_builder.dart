import 'package:flutter/material.dart';

import 'key_value_row.dart';

mixin KeyValueRowBuilder {
  Widget buildKeyValueRow(
    BuildContext context, {
    String title,
    String value,
    TextStyle titleStyle,
    TextStyle valueStyle,
  }) {
    return KeyValueRow(
      title: title,
      value: value,
      titleStyle: titleStyle,
      valueStyle: valueStyle,
    );
  }
}