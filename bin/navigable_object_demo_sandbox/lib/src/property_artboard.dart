import 'package:flutter/material.dart';
import 'package:navigator/index.dart';
import 'package:table_builder/index.dart';
import 'package:standard_icon_library/index.dart';
import 'package:property_full_screen_artboard_template/index.dart';

class PropertyArtboard extends PropertyVerticalFullScreenArtboard {
  @override
  List<Widget> buildLeasesCells(BuildContext context) {
    final leaseCell = LeaseCell(
      title: "2018-19 Lease",
      tenants: ["Big shawn", "Lil rick", "Medium bobby"],
      rentAmount: 320000,
      startTimestamp: 1512728014,
      endTimestamp: 1552728014,
    );

    return [
      leaseCell,
      leaseCell,
      leaseCell,
    ];
  }

  @override
  StandardIcon get homeIcon => StandardIcon.treehouse;

  @override
  String get paymentProfile => "Denny's big bank";

  @override
  String get propertyTitle => "200 S Dawson St. Apt. B";

  @override
  List<String> get tags => ["Howell park", "Students"];
}
