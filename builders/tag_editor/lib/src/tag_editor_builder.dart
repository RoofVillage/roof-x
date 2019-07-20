import 'package:flutter/material.dart';
import 'package:artboard/index.dart';

import '_components/tag_editor.dart';

//Tag editor must be an artboard
mixin TagEditorArtboardBuilder implements Artboard<List<String>> {
  String get title;
  List<String> get tags;
}

mixin TagEditorArtboardBuilderState<T extends TagEditorArtboardBuilder>
    implements ArtboardState<T> {
  List<String> _tags;

  List<String> get tags => _tags;
  set tags(List<String> newTags) => _tags = newTags;

  Widget buildTagEditor(BuildContext context) {
    return TagEditor(
      title: widget.title,
      tags: widget.tags,
      onTagEdited: _onTagEdited,
    );
  }

  void _onTagEdited(List<String> newTags) {
    tags = newTags;
  }
}
