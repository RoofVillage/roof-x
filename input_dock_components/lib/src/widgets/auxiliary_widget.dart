import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:icon_library/index.dart';
import 'package:spec/index.dart';
import 'auxiliary_widgets/index.dart';
import '../dock_data.dart';

class AuxiliaryWidgetReference {
  static AuxiliaryWidget get addImage {
    return AddImage();
  }

  static AuxiliaryWidget get camera {
    return Camera();
  }
}

class AuxiliaryWidget {
  final StandardIconReference iconReference;
  final DockDataCallback action;

  AuxiliaryWidget({
    @required this.iconReference,
    @required this.action,
  });

  buildForDock({double baseHeight, DockSubmitData dockData}) {
    return _AuxiliaryWidget(
      iconReference: iconReference,
      action: action,
      baseHeight: baseHeight,
      dockData: dockData,
    );
  }
}

class _AuxiliaryWidget extends StatelessWidget {
  final StandardIconReference iconReference;
  final DockDataCallback action;
  final double baseHeight;
  final DockSubmitData dockData;

  _AuxiliaryWidget({
    this.iconReference,
    this.action,
    this.baseHeight,
    this.dockData,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = RoofTheme.of(context).color.icon.general;
    final icon = iconReference.buildSvg(color: iconColor);

    onTap() {
      action(data: dockData);
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: baseHeight,
        margin: EdgeInsets.only(right: RoofDistance.c),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
