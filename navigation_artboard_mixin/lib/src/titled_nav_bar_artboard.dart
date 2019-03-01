import 'package:navigation_components/index.dart';

mixin TitledNavBarArtboard {
  List<RoofNavButton> get actionButtons;
  RoofNavButton get navButton => null;
  String get title => null;

  RoofNavBar get navBar => RoofTitleNavBar(
      actionButtons: actionButtons, title: title, navButton: navButton);
}
