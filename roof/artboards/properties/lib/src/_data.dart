import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navigation_icon_library/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:views/index.dart';

mixin PropertiesArtboardData {
  List<Widget> artboardActionButtons(BuildContext context) => [
        NavigationIcon.add.buildWidget(
          color: SemanticTheme.of(context).color.icon.nav,
        )
      ];

  String get artboardTitle => "Properties";

  final stream = Stream.value(
    PropertiesView([
      Property(
        address: "420 Choco Cake St.",
        unit: "A",
        activeLeases: [
          LeasePreview(
            name: "2019-2020 Lease A",
            amount: 1200,
            start: DateTime(2019, 9, 1),
            end: DateTime(2020, 9, 1),
          ),
          LeasePreview(
            name: "2019-2020 Lease B",
            amount: 1200,
            start: DateTime(2019, 9, 1),
            end: DateTime(2020, 9, 1),
          ),
        ],
        upcomingLeases: [
          LeasePreview(
            name: "2020-2021 Lease",
            amount: 1300,
            start: DateTime(2020, 10, 1),
            end: DateTime(2021, 10, 1),
          ),
        ],
        tags: [
          "2 bedroom",
          "deluxe",
        ],
      ),
      Property(
        address: "420 Choco Cake St.",
        unit: "B",
        activeLeases: [
          LeasePreview(
            name: "2019-2020 Lease",
            amount: 1300,
            start: DateTime(2019, 9, 1),
            end: DateTime(2020, 9, 1),
          ),
        ],
        upcomingLeases: [
          LeasePreview(
            name: "2020-2021 Lease",
            amount: 1400,
            start: DateTime(2020, 10, 1),
            end: DateTime(2021, 10, 1),
          ),
        ],
        tags: [
          "2 bedroom",
          "deluxe",
        ],
      ),
      Property(
        address: "69 Fatboy Blvd.",
        activeLeases: [
          LeasePreview(
            name: "2019-2020 Lease",
            amount: 1300,
            start: DateTime(2020, 7, 15),
            end: DateTime(2021, 7, 1),
          ),
        ],
        tags: [
          "Burrowes Corner",
        ],
      ),
    ]),
  );
}

class PropertiesView {
  List<Property> properties;

  PropertiesView(this.properties);
}
