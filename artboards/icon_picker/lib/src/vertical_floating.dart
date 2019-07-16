import 'package:flutter/material.dart';
import 'package:empty_vertical_floating_artboard_template/index.dart';
import 'package:titled_icon/index.dart';
import 'package:vertical_floating_artboard_scaffold/index.dart';
import 'package:icon_picker_builder/index.dart';

class IconPickerVerticalFloatingArtboard
    extends EmptyVerticalFloatingArtboard<TitledIcon>
    with IconPickerArtboardBuilder {
  final String title;
  final TitledIcon selectedOption;
  final List<TitledIcon> options;

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
        IconPickerBuilderArtboardState<IconPickerVerticalFloatingArtboard> {
  @override
  TitledIcon get selectedOption =>
      VerticalFloatingArtboardNavigatorPanel.of(context, shouldRebuild: false)
          .result;

  @override
  set selectedOption(TitledIcon newSelectedOption) {
    VerticalFloatingArtboardNavigatorPanel.of(context).result =
        newSelectedOption;
  }

  @override
  Widget buildBody(BuildContext context) => buildIconPicker(context);
}
