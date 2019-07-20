import 'package:flutter/material.dart';
import 'package:empty_vertical_floating_artboard_template/index.dart';
import 'package:vertical_floating_artboard_scaffold/index.dart';
import 'package:tag_editor_builder/index.dart';

class TagEditorVerticalFloatingArtboard
    extends EmptyVerticalFloatingArtboard<List<String>>
    with TagEditorArtboardBuilder {
  final String title;
  final String emptyText;
  final List<String> tags;

  TagEditorVerticalFloatingArtboard({
    this.title,
    this.emptyText,
    this.tags,
  });

  _TagEditorVerticalFloatingArtboardState createState() =>
      _TagEditorVerticalFloatingArtboardState();
}

class _TagEditorVerticalFloatingArtboardState
    extends State<TagEditorVerticalFloatingArtboard>
    with
        VerticalFloatingArtboardState<TagEditorVerticalFloatingArtboard>,
        TagEditorArtboardBuilderState<TagEditorVerticalFloatingArtboard> {
  @override
  List<String> get tags =>
      VerticalFloatingArtboardNavigatorPanel.of(context, shouldRebuild: false)
          .result;

  @override
  set tags(List<String> newTags) {
    VerticalFloatingArtboardNavigatorPanel.of(context).result = newTags;
  }

  @override
  Widget buildBody(BuildContext context) => buildTagEditor(context);
}
