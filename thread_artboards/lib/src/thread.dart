import 'package:full_screen_artboard_templates/index.dart';
import 'package:navigation_components/index.dart';
import 'package:icon_library/index.dart';
import 'package:input_dock_components/index.dart';

class ThreadArtboard extends TitledTableInputDockFullScreenArtboard {
  final _settingsButton = RoofIconNavButton(
    iconReference: IconReference.moreNav,
    onTap: ArtboardNavigator.pop,
  );

  @override
  String get title => "Take out the trash";

  @override
  RoofNavButton get navButton => RoofIconNavButton(
        iconReference: IconReference.backArrowNav,
        onTap: (context) => print("asdf"),
      );

  @override
  List<RoofNavButton> get actionButtons => [_settingsButton];

  DockActionButton get actionButton => DockActionButton(
        action: () => print("asdf"),
        actionTitle: "Hello",
        actionIconReference: IconReference.cashSack,
      );

  List<AuxiliaryWidget> get auxiliaryWidgets => [
        // AddAuxiliaryWidget(),
        AddFileAuxiliaryWidget(),
      ];
}
