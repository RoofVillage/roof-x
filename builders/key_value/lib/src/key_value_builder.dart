import 'package:flutter/material.dart';

import '_components/key_value.dart';

mixin KeyValueBuilder {
  Widget buildKeyValue(
    BuildContext context, {
    String title,
    String value,
  }) {
    return KeyValue(
      title: title,
      value: value,
    );
  }
}