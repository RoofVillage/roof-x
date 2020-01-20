import 'dart:async';

import 'package:flutter/material.dart';
import 'package:titled_table_vertical_full_screen_artboard_template/index.dart';
import 'package:view_stream_builder/index.dart';
import 'package:views/index.dart';

import '_data.dart';

class ServicesVerticalFloatingArtboard
    extends TitledVerticalFullTableScreenArtboard with ServicesArtboardData {
  @override
  List<Widget> buildActionButtons(BuildContext context) => [];

  @override
  Widget buildNavButton(BuildContext context) => null;

  @override
  Widget buildBody(BuildContext context) => ViewStreamBuilder<UserServicesView>(
        stream: servicesView,
        loading: Text('loadin'),
        empty: Text('nothin'),
        child: (context, view) => Column(
          children: view.services
              .map(
                (service) => Row(
                  children: [
                    GestureDetector(
                      onTap: () => onServiceTap(context),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 10,
                        ),
                        child: Text(
                          service.name,
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 20,
                            fontFamily: "Azo",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      );
}
