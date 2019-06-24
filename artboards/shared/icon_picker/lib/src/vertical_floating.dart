import 'package:flutter/material.dart';
import 'package:empty_vertical_floating_artboard_template/index.dart';
import 'package:icon_picker_data/index.dart';
import 'package:vertical_floating_artboard_scaffold/index.dart';
import 'package:icon_picker_builder/index.dart';

class IconPickerVerticalFloatingArtboard
    extends EmptyVerticalFloatingArtboard<IconPickerData>
    with IconPickerBuilder {
  final String title;
  final IconPickerData selectedOption;
  final List<IconPickerData> options;

  IconPickerVerticalFloatingArtboard({
    this.title,
    this.selectedOption,
    @required this.options,
  });

  _IconPickerVerticalFloatingArtboardState createState() =>
      _IconPickerVerticalFloatingArtboardState();
}

class _IconPickerVerticalFloatingArtboardState
    extends State<IconPickerVerticalFloatingArtboard>
    with
        VerticalFloatingArtboardState<IconPickerVerticalFloatingArtboard>,
        IconPickerBuilderState<IconPickerVerticalFloatingArtboard> {
  @override
  IconPickerData get selectedOption =>
      VerticalFloatingArtboardNavigatorPanel.of(context, shouldRebuild: false)
          .result;

  @override
  set selectedOption(IconPickerData newSelectedOption) {
    VerticalFloatingArtboardNavigatorPanel.of(context).result =
        newSelectedOption;
  }

  @override
  Widget buildBody(BuildContext context) => buildIconPicker(context);
}
