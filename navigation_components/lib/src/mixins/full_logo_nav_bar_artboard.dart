import '../bars/index.dart';
import '../buttons/index.dart';

mixin FullLogoNavBarArtboard {
  List<RoofNavButton> get actionButtons;

  RoofNavBar get navBar => RoofFullLogoNavBar(actionButtons: actionButtons);
}
