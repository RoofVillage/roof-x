import 'package:navigation_components/index.dart';

mixin FullLogoNavBarArtboard {
  List<RoofNavButton> get actionButtons;

  RoofNavBar get navBar => RoofFullLogoNavBar(actionButtons: actionButtons);
}
