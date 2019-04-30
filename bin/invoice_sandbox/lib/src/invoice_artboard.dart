import 'package:flutter/material.dart';
import 'package:navigator/index.dart';
import 'package:navigable_object_table_artboard_template/index.dart';
import 'package:icon_library/index.dart';
import 'package:breadcrumb_stack_builder/index.dart';
import 'package:key_value_row_builder/index.dart';
import 'package:tabbed_container_builder/index.dart';
import 'package:theme/index.dart';

class InvoiceVerticalFullScreenArtboard
    extends NavigableObjectFullScreenArtboard {
  final String title = "Invoice due soon yaa";

  @override
  List<Widget> buildActionButtons(BuildContext context) {
    final theme = RoofTheme.of(context);
    return [
      IconReference.more.buildSvg(color: theme.color.icon.nav),
    ];
  }

  @override
  Widget buildNavButton(BuildContext context) {
    final theme = RoofTheme.of(context);
    return IconReference.backArrowNav.buildSvg(color: theme.color.icon.nav);
  }

  final List<RoofBreadcrumb> breadcrumbs = [
    RoofBreadcrumb(title: "123 oak ave"),
    RoofBreadcrumb(title: "2018-2019 lease")
  ];

  final List<KeyValueRow> infoRows = [
    KeyValueRow(title: "Amount", value: "\$1,400.00"),
    KeyValueRow(title: "Due", value: "June 1, 2019")
  ];

  static final tenantsTabView = _RoofTabView(
    child: Container(
      width: 200,
      height: 200,
      child: Text("Tenants"),
    ),
  );

  static final otherTabView = _RoofTabView(
    child: Container(
      width: 200,
      height: 200,
      child: Text("Something Else"),
    ),
  );

  final List<RoofTab> tabs = [
    RoofTab(title: "Tenants", view: tenantsTabView),
    RoofTab(title: "Other", view: otherTabView)
  ];
}

class _RoofTabView extends StatelessWidget {
  final child;

  _RoofTabView({this.child, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
