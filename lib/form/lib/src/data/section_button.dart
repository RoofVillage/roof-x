import 'package:flutter/material.dart';
import 'package:small_icon_library/index.dart';
import 'package:stream/index.dart';

class StreamableFormSectionButtonData extends StreamableData {
  final String text;
  final SmallIcon icon;
  final void Function() onTap;

  StreamableFormSectionButtonData({
    @required this.text,
    this.icon,
    this.onTap,
  });
}
