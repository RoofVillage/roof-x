import 'package:button_builder/index.dart';
import 'package:button_row_dock_builder/index.dart';
import 'package:commands/index.dart';
import 'package:empty_table_vertical_full_screen_artboard_template/index.dart';
import 'package:flutter/material.dart';
import 'package:navigator/index.dart';
import 'package:secret_key_artboard/index.dart';
import 'package:views/index.dart';
import 'package:view_stream_builder_builder/index.dart';

import '_data.dart';

class ServiceDashboardVerticalFullscreenArtboard
    extends EmptyTableVerticalFullScreenArtboard
    with
        ServiceDashboardArtboardData,
        ButtonRowDockBuilder,
        SecondaryCenterButtonBuilder,
        PrimaryCenterButtonBuilder,
        ViewStreamBuilderBuilder {
  void _generateKey(BuildContext context) {
    // ServiceCommands()
    //     .generateKey(
    //   serviceId: "unique123",
    // )
    //     .then(
    //   (onValue) {
    //     print("then");
    //     final key = onValue.body['private'];
    //     print("key $key");
    //     return ArtboardNavigator.of(context).goTo(
    //       SecretKeyVerticalFloatingArtboard(
    //         secretKey: key,
    //       ),
    //     );
    //   },
    // );
  }

  Widget _serviceName(ServiceDashboardView view) => Text(
        "Service created: ${view.name}",
        style: TextStyle(
          color: Colors.white30,
          fontSize: 40,
          fontWeight: FontWeight.w900,
          fontFamily: 'Azo',
        ),
      );

  Widget _serviceKeys(ServiceDashboardView view) => Column(
        children: view.keys
            .map(
              (key) => Text(
                "Key: $key",
                style: TextStyle(
                  color: Colors.white30,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Azo',
                ),
              ),
            )
            .toList(),
      );

  @override
  Widget buildBody(BuildContext context) => Center(
        child: buildViewStreamBuilder<ServiceDashboardView>(
          context,
          stream: service,
          loading: Text('loadin'),
          empty: Text('nothin'),
          child: (context, view) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _serviceName(view),
              _serviceKeys(view),
              Container(
                child: buildSecondaryCenterButton(
                  context,
                  text: "Generate new key",
                  onTap: () => _generateKey(context),
                ),
                margin: EdgeInsets.symmetric(vertical: 50),
              ),
            ],
          ),
        ),
      );

  @override
  List<Widget> Function(BuildContext) get dockButtons => (context) => [
        buildPrimaryCenterButton(
          context,
          text: "Save",
          onTap: () => print('save'), // ServiceCommands().save(),
        )
      ];

  @override
  Widget buildDock(BuildContext context) {
    return buildButtonRowDock(context);
  }
}
