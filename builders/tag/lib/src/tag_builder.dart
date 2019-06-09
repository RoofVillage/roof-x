import 'package:flutter/material.dart';
import '_components/tag.dart';

mixin RoofTagBuilder {
  RoofTag buildTag(BuildContext context, {String text, Color color}) {
    return RoofTag(text: text, color: color);
  }
}
