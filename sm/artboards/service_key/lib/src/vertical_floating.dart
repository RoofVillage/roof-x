import 'package:button/index.dart';
import 'package:button_row_dock_builder/index.dart';
import 'package:commands/index.dart';
import 'package:empty_table_vertical_full_screen_artboard_template/index.dart';
import 'package:flutter/material.dart';

import '_data.dart';

class ServiceKeyVerticalFullscreenArtboard
    extends EmptyTableVerticalFullScreenArtboard
    with ServiceKeyArtboardData, ButtonRowDockBuilder {
  @override
  Widget buildBody(BuildContext context) => ServiceNameView();

  @override
  List<Widget> Function(BuildContext) get dockButtons => (context) => [
        RoofPrimaryCenterButton(
          text: "Save",
          onTap: (context) => ServiceCommands().save(),
        )
      ];

  @override
  Widget buildDock(BuildContext context) {
    return buildButtonRowDock(context);
  }
}

class ServiceNameView extends StatefulWidget {
  @override
  _ServiceNameViewState createState() => _ServiceNameViewState();
}

class _ServiceNameViewState extends State<ServiceNameView>
    with ServiceKeyArtboardData {
  String _serviceName;
  String _serviceKey;

  awaitServiceName() async {
    _serviceName = await serviceName;
    setState(() {});
  }

  getServiceKey() async {
    _serviceKey = await serviceKey;
    setState(() {});
  }

  @override
  void initState() {
    awaitServiceName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final keyView = _serviceKey != null
        ? Padding(
            child: Text(
              "Service created: $_serviceKey",
              style: TextStyle(
                color: Colors.white30,
                fontSize: 40,
                fontWeight: FontWeight.w900,
                fontFamily: 'Azo',
              ),
            ),
            padding: EdgeInsets.only(top: 50),
          )
        : Container();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          child: Text(
            "Service created: $_serviceName",
            style: TextStyle(
              color: Colors.white30,
              fontSize: 40,
              fontWeight: FontWeight.w900,
              fontFamily: 'Azo',
            ),
          ),
          padding: EdgeInsets.only(bottom: 50),
        ),
        RoofSecondaryCenterButton(
          text: "Get key",
          onTap: (cont) => getServiceKey(),
        ),
        keyView
      ],
    );
  }
}
