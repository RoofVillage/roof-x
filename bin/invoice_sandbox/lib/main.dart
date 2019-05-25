import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:table_builder/index.dart';
import 'package:icon_library/index.dart';
import 'package:decorated_text/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:key_value_builder/index.dart';
import 'package:nav_bar_builder/index.dart';
import 'package:breadcrumb_stack_builder/index.dart';
import 'package:artboard/index.dart';
import 'src/invoice_artboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoofTheme(
      RoofThemeOption.light,
      child: MaterialApp(
        title: 'Invoice sandbox',
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // body: InvoiceSandbox(),
          body: InvoiceVerticalFullScreenArtboard(),
        ),
      ),
    );
  }
}

// class InvoiceSandbox extends StatelessWidget
//     with TitledNavBarBuilder, RoofBreadcrumbBuilder {
//   String get title => "Rent due Nov 1";

//   @override
//   List<Widget> buildActionButtons(BuildContext context) {
//     // TODO: implement buildActionButtons
//     return [];
//   }

//   @override
//   Widget buildNavButton(BuildContext context) {
//     final theme = RoofTheme.of(context);

//     return IconReference.backArrowNav.buildSvg(
//       color: theme.color.icon.nav,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = RoofTheme.of(context);

//     final titleBar = buildTitledNavBar(context);

//     final propertyBreadcrumb = RoofBreadcrumb(
//       title: "80 Center Saranac",
//       iconReference: IconReference.boxUnchecked,
//     );
//     final leaseBreadcrumb = RoofBreadcrumb(
//       title: "Appt 1 Lease (2018-2019)",
//       iconReference: IconReference.boxUnchecked,
//     );

//     final breadcrumbStack = buildBreadcrumbStack(context, breadcrumbs: [
//       leaseBreadcrumb,
//       propertyBreadcrumb,
//     ]);

//     return Scaffold(
//       backgroundColor: theme.color.background.generalSecondary,
//       body: Column(
//         children: [
//           titleBar,
//           breadcrumbStack,
//         ],
//       ),
//     );
//   }
// }
