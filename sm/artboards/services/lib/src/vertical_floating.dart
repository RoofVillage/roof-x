import 'package:flutter/material.dart';
import 'package:titled_table_vertical_full_screen_artboard_template/index.dart';
import 'package:views/index.dart';

import '_data.dart';

class ServicesVerticalFloatingArtboard
    extends TitledVerticalFullTableScreenArtboard with ServicesArtboardData {
  @override
  List<Widget> buildActionButtons(BuildContext context) {
    return [];
  }

  @override
  Widget buildNavButton(BuildContext context) {
    return null;
  }

  @override
  Widget buildBody(BuildContext context) => _ServicesView();
}

class _ServicesView extends StatefulWidget {
  @override
  _ServicesViewState createState() => _ServicesViewState();
}

class _ServicesViewState extends State<_ServicesView>
    with ServicesArtboardData {
  List<UserServiceView> _services;

  awaitServices() async {
    _services = await services;
    setState(() {});
    print(_services);
  }

  @override
  void initState() {
    awaitServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> serviceRows = _services != null
        ? _services
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
            .toList()
        : [];

    return Column(
      children: serviceRows,
    );
  }
}
