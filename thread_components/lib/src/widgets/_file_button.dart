import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:theme/index.dart';

class FileButton extends StatelessWidget {
  final double baseHeight;

  FileButton({this.baseHeight});

  @override
  Widget build(BuildContext context) {
    final iconColor = RoofTheme.of(context).color.icon.general;

    final fileIcon = IconReference.cashSack.buildSvg(color: iconColor);

    return GestureDetector(
      child: Container(height: baseHeight, child: fileIcon),
    );
  }
}
